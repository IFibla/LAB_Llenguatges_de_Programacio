# Generated from /Users/ignasi/Documents/_Q6_/_LP_/_Practica_2_Python_JSBach/jsbach.g4 by ANTLR 4.10.1
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .jsbachParser import jsbachParser
else:
    from jsbachParser import jsbachParser

# This class defines a complete listener for a parse tree produced by jsbachParser.
class jsbachListener(ParseTreeListener):

    # Enter a parse tree produced by jsbachParser#root.
    def enterRoot(self, ctx:jsbachParser.RootContext):
        pass

    # Exit a parse tree produced by jsbachParser#root.
    def exitRoot(self, ctx:jsbachParser.RootContext):
        pass


    # Enter a parse tree produced by jsbachParser#functiondefinition.
    def enterFunctiondefinition(self, ctx:jsbachParser.FunctiondefinitionContext):
        pass

    # Exit a parse tree produced by jsbachParser#functiondefinition.
    def exitFunctiondefinition(self, ctx:jsbachParser.FunctiondefinitionContext):
        pass


    # Enter a parse tree produced by jsbachParser#Assign.
    def enterAssign(self, ctx:jsbachParser.AssignContext):
        pass

    # Exit a parse tree produced by jsbachParser#Assign.
    def exitAssign(self, ctx:jsbachParser.AssignContext):
        pass


    # Enter a parse tree produced by jsbachParser#Ifelse.
    def enterIfelse(self, ctx:jsbachParser.IfelseContext):
        pass

    # Exit a parse tree produced by jsbachParser#Ifelse.
    def exitIfelse(self, ctx:jsbachParser.IfelseContext):
        pass


    # Enter a parse tree produced by jsbachParser#Read.
    def enterRead(self, ctx:jsbachParser.ReadContext):
        pass

    # Exit a parse tree produced by jsbachParser#Read.
    def exitRead(self, ctx:jsbachParser.ReadContext):
        pass


    # Enter a parse tree produced by jsbachParser#Write.
    def enterWrite(self, ctx:jsbachParser.WriteContext):
        pass

    # Exit a parse tree produced by jsbachParser#Write.
    def exitWrite(self, ctx:jsbachParser.WriteContext):
        pass


    # Enter a parse tree produced by jsbachParser#Play.
    def enterPlay(self, ctx:jsbachParser.PlayContext):
        pass

    # Exit a parse tree produced by jsbachParser#Play.
    def exitPlay(self, ctx:jsbachParser.PlayContext):
        pass


    # Enter a parse tree produced by jsbachParser#Listinsert.
    def enterListinsert(self, ctx:jsbachParser.ListinsertContext):
        pass

    # Exit a parse tree produced by jsbachParser#Listinsert.
    def exitListinsert(self, ctx:jsbachParser.ListinsertContext):
        pass


    # Enter a parse tree produced by jsbachParser#Listcut.
    def enterListcut(self, ctx:jsbachParser.ListcutContext):
        pass

    # Exit a parse tree produced by jsbachParser#Listcut.
    def exitListcut(self, ctx:jsbachParser.ListcutContext):
        pass


    # Enter a parse tree produced by jsbachParser#While.
    def enterWhile(self, ctx:jsbachParser.WhileContext):
        pass

    # Exit a parse tree produced by jsbachParser#While.
    def exitWhile(self, ctx:jsbachParser.WhileContext):
        pass


    # Enter a parse tree produced by jsbachParser#Functioncall.
    def enterFunctioncall(self, ctx:jsbachParser.FunctioncallContext):
        pass

    # Exit a parse tree produced by jsbachParser#Functioncall.
    def exitFunctioncall(self, ctx:jsbachParser.FunctioncallContext):
        pass


    # Enter a parse tree produced by jsbachParser#Add.
    def enterAdd(self, ctx:jsbachParser.AddContext):
        pass

    # Exit a parse tree produced by jsbachParser#Add.
    def exitAdd(self, ctx:jsbachParser.AddContext):
        pass


    # Enter a parse tree produced by jsbachParser#Listsize.
    def enterListsize(self, ctx:jsbachParser.ListsizeContext):
        pass

    # Exit a parse tree produced by jsbachParser#Listsize.
    def exitListsize(self, ctx:jsbachParser.ListsizeContext):
        pass


    # Enter a parse tree produced by jsbachParser#Lower.
    def enterLower(self, ctx:jsbachParser.LowerContext):
        pass

    # Exit a parse tree produced by jsbachParser#Lower.
    def exitLower(self, ctx:jsbachParser.LowerContext):
        pass


    # Enter a parse tree produced by jsbachParser#VariableName.
    def enterVariableName(self, ctx:jsbachParser.VariableNameContext):
        pass

    # Exit a parse tree produced by jsbachParser#VariableName.
    def exitVariableName(self, ctx:jsbachParser.VariableNameContext):
        pass


    # Enter a parse tree produced by jsbachParser#GreaterOrEqual.
    def enterGreaterOrEqual(self, ctx:jsbachParser.GreaterOrEqualContext):
        pass

    # Exit a parse tree produced by jsbachParser#GreaterOrEqual.
    def exitGreaterOrEqual(self, ctx:jsbachParser.GreaterOrEqualContext):
        pass


    # Enter a parse tree produced by jsbachParser#String.
    def enterString(self, ctx:jsbachParser.StringContext):
        pass

    # Exit a parse tree produced by jsbachParser#String.
    def exitString(self, ctx:jsbachParser.StringContext):
        pass


    # Enter a parse tree produced by jsbachParser#OperationPriority.
    def enterOperationPriority(self, ctx:jsbachParser.OperationPriorityContext):
        pass

    # Exit a parse tree produced by jsbachParser#OperationPriority.
    def exitOperationPriority(self, ctx:jsbachParser.OperationPriorityContext):
        pass


    # Enter a parse tree produced by jsbachParser#NotEquals.
    def enterNotEquals(self, ctx:jsbachParser.NotEqualsContext):
        pass

    # Exit a parse tree produced by jsbachParser#NotEquals.
    def exitNotEquals(self, ctx:jsbachParser.NotEqualsContext):
        pass


    # Enter a parse tree produced by jsbachParser#Remainder.
    def enterRemainder(self, ctx:jsbachParser.RemainderContext):
        pass

    # Exit a parse tree produced by jsbachParser#Remainder.
    def exitRemainder(self, ctx:jsbachParser.RemainderContext):
        pass


    # Enter a parse tree produced by jsbachParser#Integer.
    def enterInteger(self, ctx:jsbachParser.IntegerContext):
        pass

    # Exit a parse tree produced by jsbachParser#Integer.
    def exitInteger(self, ctx:jsbachParser.IntegerContext):
        pass


    # Enter a parse tree produced by jsbachParser#Divide.
    def enterDivide(self, ctx:jsbachParser.DivideContext):
        pass

    # Exit a parse tree produced by jsbachParser#Divide.
    def exitDivide(self, ctx:jsbachParser.DivideContext):
        pass


    # Enter a parse tree produced by jsbachParser#Equals.
    def enterEquals(self, ctx:jsbachParser.EqualsContext):
        pass

    # Exit a parse tree produced by jsbachParser#Equals.
    def exitEquals(self, ctx:jsbachParser.EqualsContext):
        pass


    # Enter a parse tree produced by jsbachParser#LowerOrEqual.
    def enterLowerOrEqual(self, ctx:jsbachParser.LowerOrEqualContext):
        pass

    # Exit a parse tree produced by jsbachParser#LowerOrEqual.
    def exitLowerOrEqual(self, ctx:jsbachParser.LowerOrEqualContext):
        pass


    # Enter a parse tree produced by jsbachParser#Multiply.
    def enterMultiply(self, ctx:jsbachParser.MultiplyContext):
        pass

    # Exit a parse tree produced by jsbachParser#Multiply.
    def exitMultiply(self, ctx:jsbachParser.MultiplyContext):
        pass


    # Enter a parse tree produced by jsbachParser#Listinitialization.
    def enterListinitialization(self, ctx:jsbachParser.ListinitializationContext):
        pass

    # Exit a parse tree produced by jsbachParser#Listinitialization.
    def exitListinitialization(self, ctx:jsbachParser.ListinitializationContext):
        pass


    # Enter a parse tree produced by jsbachParser#Listposition.
    def enterListposition(self, ctx:jsbachParser.ListpositionContext):
        pass

    # Exit a parse tree produced by jsbachParser#Listposition.
    def exitListposition(self, ctx:jsbachParser.ListpositionContext):
        pass


    # Enter a parse tree produced by jsbachParser#Greater.
    def enterGreater(self, ctx:jsbachParser.GreaterContext):
        pass

    # Exit a parse tree produced by jsbachParser#Greater.
    def exitGreater(self, ctx:jsbachParser.GreaterContext):
        pass


    # Enter a parse tree produced by jsbachParser#MusicalNote.
    def enterMusicalNote(self, ctx:jsbachParser.MusicalNoteContext):
        pass

    # Exit a parse tree produced by jsbachParser#MusicalNote.
    def exitMusicalNote(self, ctx:jsbachParser.MusicalNoteContext):
        pass


    # Enter a parse tree produced by jsbachParser#Minus.
    def enterMinus(self, ctx:jsbachParser.MinusContext):
        pass

    # Exit a parse tree produced by jsbachParser#Minus.
    def exitMinus(self, ctx:jsbachParser.MinusContext):
        pass



del jsbachParser