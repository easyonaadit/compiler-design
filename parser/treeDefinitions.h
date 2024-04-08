typedef struct expression *expresstionTree;

typedef enum
{
    PlusOp,
    MinusOp,
    TimesOp,
    DivideOp
} optype;

struct expression
{
    enum
    {
        operatorExp, // 0
        constantExp, // 1
        variableExp  // 2
    } kind;
    union
    {
        struct
        {
            optype op;
            expresstionTree left;
            expresstionTree right;
        } oper;
        int constantVal;
        char *variable;

    } u;
    int line_number;
};

expresstionTree operatorExpression(optype op, expresstionTree left, expresstionTree right, int line_number);
expresstionTree IdentifierExpression(char *variable, int line_number);
expresstionTree ConstantExpression(int constantVal, int line_number);
