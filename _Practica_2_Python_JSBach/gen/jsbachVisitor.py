# Generated from /Users/ignasi/Documents/_Q6_/_LP_/_Practica_2_Python_JSBach/jsbach.g4 by ANTLR 4.10.1
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .jsbachParser import jsbachParser
else:
    from jsbachParser import jsbachParser

# This class defines a complete generic visitor for a parse tree produced by jsbachParser.

class jsbachVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by jsbachParser#root.
    def visitRoot(self, ctx:jsbachParser.RootContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#functiondefinition.
    def visitFunctiondefinition(self, ctx:jsbachParser.FunctiondefinitionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Assign.
    def visitAssign(self, ctx:jsbachParser.AssignContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Ifelse.
    def visitIfelse(self, ctx:jsbachParser.IfelseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Read.
    def visitRead(self, ctx:jsbachParser.ReadContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Write.
    def visitWrite(self, ctx:jsbachParser.WriteContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Play.
    def visitPlay(self, ctx:jsbachParser.PlayContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Listinsert.
    def visitListinsert(self, ctx:jsbachParser.ListinsertContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Listcut.
    def visitListcut(self, ctx:jsbachParser.ListcutContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#While.
    def visitWhile(self, ctx:jsbachParser.WhileContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Functioncall.
    def visitFunctioncall(self, ctx:jsbachParser.FunctioncallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Add.
    def visitAdd(self, ctx:jsbachParser.AddContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Listsize.
    def visitListsize(self, ctx:jsbachParser.ListsizeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Lower.
    def visitLower(self, ctx:jsbachParser.LowerContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#VariableName.
    def visitVariableName(self, ctx:jsbachParser.VariableNameContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#GreaterOrEqual.
    def visitGreaterOrEqual(self, ctx:jsbachParser.GreaterOrEqualContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#String.
    def visitString(self, ctx:jsbachParser.StringContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#OperationPriority.
    def visitOperationPriority(self, ctx:jsbachParser.OperationPriorityContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#NotEquals.
    def visitNotEquals(self, ctx:jsbachParser.NotEqualsContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Remainder.
    def visitRemainder(self, ctx:jsbachParser.RemainderContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Integer.
    def visitInteger(self, ctx:jsbachParser.IntegerContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Divide.
    def visitDivide(self, ctx:jsbachParser.DivideContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Equals.
    def visitEquals(self, ctx:jsbachParser.EqualsContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#LowerOrEqual.
    def visitLowerOrEqual(self, ctx:jsbachParser.LowerOrEqualContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Multiply.
    def visitMultiply(self, ctx:jsbachParser.MultiplyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Listinitialization.
    def visitListinitialization(self, ctx:jsbachParser.ListinitializationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Listposition.
    def visitListposition(self, ctx:jsbachParser.ListpositionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Greater.
    def visitGreater(self, ctx:jsbachParser.GreaterContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#MusicalNote.
    def visitMusicalNote(self, ctx:jsbachParser.MusicalNoteContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by jsbachParser#Minus.
    def visitMinus(self, ctx:jsbachParser.MinusContext):
        return self.visitChildren(ctx)



del jsbachParser