import os
import time
import sys
from collections import defaultdict
from antlr4 import *
from gen.jsbachLexer import jsbachLexer
from gen.jsbachParser import jsbachParser
from gen.jsbachVisitor import jsbachVisitor


class MyJsBachException(Exception):
    def __init__(self, message, type=0):
        if type == 0:
            self.message = '[ERROR]: ' + message
        elif type == 1:
            self.message = "[WARNING]:" + message


class Function:
    def __init__(self, name, params, instructions):
        self.name = name
        self.params = params
        self.instructions = instructions


class MyJsBachVisitor(jsbachVisitor):
    def __init__(self, entryProc, entryParams=[]):
        self.entryProc = entryProc
        self.entryParams = entryParams
        self.functions = {}
        self.stack = []
        self.score = []

    def __proc__(self, name, paramsValues):
        if len(self.functions[name].params) != len(paramsValues):
            raise MyJsBachException("'In \"' + name + '\" function expected ' + str(len(" +
                                    self.functions[name].params + ' param(s), ' + str(len(paramsValues)) + ' given.')
        variables = defaultdict(lambda: 0)
        for param, value in zip(self.functions[name].params, paramsValues):
            variables[param] = value
        self.stack.append(variables)
        for i in range(0, len(self.functions[name].instructions)):
            self.visit(self.functions[name].instructions[i])
        self.stack.pop()

    def music_play(self):
        tempo_num = 4
        score_list = self.score
        score = ""
        for s in score_list:
            score += s.lower() + "'{tempo_num}".format(tempo_num=tempo_num)

        lily_script = '\\version 2.22.1 \n' \
                      '\\score {open_bracket} \n' \
                      '\t \\absolute {open_bracket} \n' \
                      '\t \t \\tempo {tempo_num} = {tempo_speed} \n' \
                      '\t \t \t {score} \n' \
                      '\t \t {close_bracket} \n' \
                      '\t \\layout {open_bracket} {close_bracket} \n' \
                      '\t \\midi {open_bracket} {close_bracket} \n' \
                      '{close_bracket}'.format(tempo_num=tempo_num, tempo_speed=120, score=score,
                                               open_bracket='{', close_bracket='}')
        file = open("jsbach_music.lily", "x")
        file.write(lily_script)
        file.close()
        directories = os.system("lilypond jsbach_music.lily")
        print(directories)
        directories = os.system("timidity -Ow -o jsbach_music.wav jsbach_music.midi")
        directories = os.system("ffmpeg -i jsbach_music.wav -codec:a libmp3lame -qscale:a 2 jsbach_music.mp3")
        directories = os.system("afplay jsbach_music.mp3")
        directories = os.system("rm jsbach_music.lily")
        print(directories)

    def visitRoot(self, ctx: jsbachParser.RootContext):
        for proc in list(ctx.getChildren()):
            self.visit(proc)
        self.__proc__(self.entryProc, self.entryParams)

    def visitFunctiondefinition(self, ctx: jsbachParser.FunctiondefinitionContext):
        name = ctx.FUNCTIONNAME().getText()
        i = 1
        params = []
        while ctx.getChild(i).getText() != '|:':
            if ctx.getChild(i).getText() != ',':
                param = ctx.getChild(i).getText()
                if param in params:
                    raise MyJsBachException(
                        'Duplicated param in \"' + name + '\" proc definition.')
                else:
                    params.append(ctx.getChild(i).getText())
            i += 1
        if name in self.functions:
            raise MyJsBachException('Proc \"' + name + '\" already defined.')
        else:
            self.functions[name] = Function(name, params, ctx.instructions())

    def visitAssign(self, ctx: jsbachParser.AssignContext):
        var = self.visit(ctx.expressions())
        if type(var) == tuple:
            var = var[2]
        self.stack[-1][ctx.VARIABLENAME().getText()] = var

    def visitIfelse(self, ctx):
        if self.visit(ctx.expressions()) == 1:
            for inst in ctx.instructions():
                self.visit(inst)
        elif ctx.getChild(5).getText() == 'else |:':
            for inst in ctx.instructions():
                self.visit(inst)

    def visitRead(self, ctx: jsbachParser.ReadContext):
        variable_name = self.visitChildren(ctx)
        inputvalue = input('>>> ')
        if '{' in inputvalue and '}' in inputvalue:
            inputvalue = list(inputvalue.replace('{', '').replace('}', '').split(' '))
        if inputvalue.isdigit():
            inputvalue = int(inputvalue)
        self.stack[-1][variable_name] = inputvalue

    def visitWrite(self, ctx: jsbachParser.WriteContext):
        print_string = ""
        for proc in list(ctx.getChildren())[1:]:
            value = self.visit(proc)
            if value in self.stack[-1]:
                print_string = print_string + str(self.stack[-1][value]) + ' '
            else:
                print_string = print_string + str(value).replace('"', '') + ' '
        print(print_string)

    def visitFunctioncall(self, ctx: jsbachParser.FunctioncallContext):
        function_name = ctx.FUNCTIONNAME().getText()
        params = []
        for param in ctx.expressions():
            value = self.visit(param)
            if value in self.stack[-1]:
                value = self.stack[-1][value]
            params.append(value)
        self.__proc__(function_name, params)

    # Visit a parse tree produced by jsbachParser#Play.
    def visitPlay(self, ctx: jsbachParser.PlayContext):
        list_name = ctx.VARIABLENAME().getText()
        if list_name not in self.stack[-1]:
            self.score.append(list_name)
        else:
            val = self.stack[-1][list_name]
            self.score.append(val)

    # Visit a parse tree produced by jsbachParser#Listinsert.
    def visitListinsert(self, ctx: jsbachParser.ListinsertContext):
        list_name = ctx.VARIABLENAME().getText()
        if list_name not in self.stack[-1]:
            raise MyJsBachException('Variable {var_name} does not exist'.format(var_name=list_name))
        val = self.visit(ctx.expressions())
        if val in self.stack[-1]:
            self.stack[-1][list_name].append(self.stack[-1][val])
        else:
            self.stack[-1][list_name].append(val)
        return self.visitChildren(ctx)

    # Visit a parse tree produced by jsbachParser#Listcut.
    def visitListcut(self, ctx: jsbachParser.ListcutContext):
        list_name, position, value = self.visitChildren(ctx)
        if list_name not in self.stack[-1]:
            raise MyJsBachException('Variable {var_name} does not exist'.format(var_name=list_name))
        self.stack[-1][list_name].pop(position-1)

    # Visit a parse tree produced by jsbachParser#While.
    def visitWhile(self, ctx):
        condition = True
        for expr in ctx.expressions():
            condition = (condition and self.visit(expr))
        while condition:
            for expr in ctx.expressions():
                condition = (condition and self.visit(expr))
            for inst in ctx.instructions():
                self.visit(inst)

    def visitAdd(self, ctx: jsbachParser.AddContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException('Variable types do not match. Trying to add a {var1} with {var2}'.format(var1=str(type(left_expr)), var2=str(type(right_expr))))
        if type(left_expr) != int:
            raise MyJsBachException('Trying to add invalid types')
        return left_expr + right_expr

    def visitListsize(self, ctx: jsbachParser.ListsizeContext):
        var_name = ctx.VARIABLENAME().getText()
        return len(self.stack[-1][var_name])

    def visitLower(self, ctx: jsbachParser.LowerContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException('Variable types do not match. Trying to compare a {var1} with {var2}'.format(var1=str(type(left_expr)), var2=str(type(right_expr))))
        return left_expr < right_expr

    def visitVariableName(self, ctx: jsbachParser.VariableNameContext):
        return ctx.VARIABLENAME().getText()

    def visitGreaterOrEqual(self, ctx: jsbachParser.GreaterOrEqualContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to compare a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        return left_expr >= right_expr

    def visitString(self, ctx: jsbachParser.StringContext):
        return ctx.NORMALSTRING().getText()

    def visitOperationPriority(self, ctx: jsbachParser.OperationPriorityContext):
        return self.visit(ctx.expressions())

    def visitNotEquals(self, ctx: jsbachParser.NotEqualsContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to compare a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        return left_expr != right_expr

    def visitRemainder(self, ctx: jsbachParser.RemainderContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to divide a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        if type(left_expr) != int:
            raise MyJsBachException('Trying to divide invalid types')
        return left_expr % right_expr

    def visitInteger(self, ctx: jsbachParser.IntegerContext):
        return int(ctx.INTEGER().getText())

    def visitDivide(self, ctx: jsbachParser.DivideContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to divide a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        if type(left_expr) != int:
            raise MyJsBachException('Trying to divide invalid types')
        return int(left_expr / right_expr)

    def visitEquals(self, ctx: jsbachParser.EqualsContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to compare a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        return left_expr == right_expr

    def visitLowerOrEqual(self, ctx: jsbachParser.LowerOrEqualContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to compare a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        return left_expr <= right_expr

    def visitMultiply(self, ctx: jsbachParser.MultiplyContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to multiply a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        if type(left_expr) != int:
            raise MyJsBachException('Trying to multipy invalid types')
        return left_expr * right_expr

    def visitListinitialization(self, ctx: jsbachParser.ListinitializationContext):
        note_list = list()
        for proc in list(ctx.getChildren())[1:-1]:
            note_list.append(proc.getText())
        return note_list

    # Visit a parse tree produced by jsbachParser#Listposition.
    def visitListposition(self, ctx: jsbachParser.ListpositionContext):
        return ctx.VARIABLENAME().getText(), self.visit(ctx.expressions()), self.stack[-1][ctx.VARIABLENAME().getText()][self.visit(ctx.expressions())-1]

    def visitGreater(self, ctx: jsbachParser.GreaterContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to compare a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        return left_expr > right_expr

    # Visit a parse tree produced by jsbachParser#MusicalNote.
    def visitMusicalNote(self, ctx: jsbachParser.MusicalNoteContext):
        return ctx.MUSICALNOTE().getText()

    # Visit a parse tree produced by jsbachParser#Minus.
    def visitMinus(self, ctx: jsbachParser.MinusContext):
        left_expr = self.visit(ctx.expressions(0))
        right_expr = self.visit(ctx.expressions(1))
        if type(left_expr) != type(right_expr) or left_expr in self.stack[-1] or right_expr in self.stack[-1]:
            if left_expr in self.stack[-1]:
                left_expr = self.stack[-1][left_expr]
            if right_expr in self.stack[-1]:
                right_expr = self.stack[-1][right_expr]
            if type(left_expr) != type(right_expr):
                raise MyJsBachException(
                    'Variable types do not match. Trying to substract a {var1} with {var2}'.format(
                        var1=str(type(left_expr)), var2=str(type(right_expr))))
        if type(left_expr) != int:
            raise MyJsBachException('Trying to substract invalid types')
        return left_expr - right_expr


def main(filepath, entry_function='Main'):
    input_stream = FileStream(filepath)
    lexer = jsbachLexer(input_stream)
    token_stream = CommonTokenStream(lexer)

    parser = jsbachParser(token_stream)
    tree = parser.root()

    print(tree.toStringTree(recog=parser))

    visitor = MyJsBachVisitor(entry_function)
    visitor.visit(tree)
    visitor.music_play()

if __name__ == '__main__':
    path = sys.argv[1]
    if len(sys.argv) > 2:
        entry_function = sys.argv[2]
        main(path, entry_function)
    else:
        main(path)
