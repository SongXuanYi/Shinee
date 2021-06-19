%{
/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2021Äê6ÔÂ17ÈÕ
****************************************************************************/
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// parser name
%name myparser

// class members
{
		// place any extra class members here
}

// constructor
{
		// place any extra initialisation code here
}

// attribute type
%union {
		public int value;
		public String strValue;
		public void yycopy(yyattribute source, boolean move) {
			YYSTYPE yy = (YYSTYPE)source;
			value = yy.value;
			strValue = yy.strValue;
		}
}

// place any declarations here
%token WORDS
%token NUMBER
%token NEWLINE
%token EQUAL
%left PLUS SUB
%left MULTI DIV
%start express
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)
express
:WORDS EQUAL dexpress NEWLINE
{
System.out.println("equal express");
$1.value = $3.value;
System.out.println($1.strValue+"="+$1.value);
};
dexpress
:dexpress PLUS dexpress
{
System.out.println("plus express");
$$.value = $1.value+$3.value;
System.out.println($$.value);
};
dexpress
:dexpress SUB dexpress
{
System.out.println("sub express");
$$.value = $1.value-$3.value;
System.out.println($$.value);
};
dexpress
:dexpress MULTI dexpress
{
System.out.println("multi express");
$$.value = $1.value*$3.value;
System.out.println($$.value);
};
dexpress
:NUMBER
{
$$.value = $1.value;
System.out.println("Number to dexpress"+$1.value);
};
dexpress
:dexpress DIV dexpress
{
System.out.println("Div express");
$$.value = $1.value/$3.value;
System.out.println($$.value);
};
%%

/////////////////////////////////////////////////////////////////////////////
// programs section

	public static void main(String args[]) {
		int n = 1;
		mylexer lexer = new mylexer();
		myparser parser = new myparser();
		if (parser.yycreate(lexer)) {
			if (lexer.yycreate(parser)) {
				n = parser.yyparse();
			}
		}
		System.exit(n);
	}

}

