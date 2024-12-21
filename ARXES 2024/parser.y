%{
    /* Το αρχείο Bison  -> parser.y
    Στο πρώτο τμήμα του ορίζεται ο κώδικας C*/ 
    #include <stdio.h>
    #include <stdlib.h>
    #include <unistd.h>
    

extern FILE *yyin; // Εξωτερική δήλωση για το αρχείο εισόδου
extern int yylex(); // Εξωτερική δήλωση για τη συνάρτηση λεκτικής ανάλυσης
extern char *yytext; // Εξωτερική δήλωση για τη μεταβλητή yytext
extern int yylineno; // Εξωτερική δήλωση για τη μεταβλητή yylineno

int error_count = 0; // Μεταβλητή για την καταγραφή του αριθμού των σφαλμάτων
int flag_err_type = 0; // Μεταβλητή για τον έλεγχο του είδους του σφάλματος
int scope = 0; // Μεταβλητή για το επίπεδο εμβέλειας των μεταβλητών

void yyerror(const char *message); // Πρότυπο για τη συνάρτηση διαχείρισης σφαλμάτων
   
    
    %}


%token PUBLIC PRIVATE VOID INT CHAR DOUBLE BOOLEAN STRING CLASS NEW RETURN IF ELSE WHILE DO FOR SWITCH CASE DEFAULT BREAK TRUE FALSE OUTPRINT OUTPRINTLN
%token EQ_OP COLON NE_OP GE_OP LE_OP AND_OP OR_OP EROTIMATIKO COMMA EQUALS GREATER_THAN LESS_THAN PLUS MINUS STAR SLASH
%token T_VAR T_INTEGER T_DOUBLE T_STR T_INTEGER_STRING LEFT_PAR RIGHT_PAR LEFT_BRC RIGHT_BRC QT



%start program

// Grammar rules
%%
program: 
    class_list
    ;

class_list:
    class_list class_decl
    | class_decl
    ;

class_decl:
    PUBLIC CLASS identifier RIGHT_BRC var_decls method_decls LEFT_BRC
    ;


method_decls:
    method_decls method_decl
    | method_decl
    | %empty
    ;


method_decl:
    modifier type identifier RIGHT_PAR param_list LEFT_PAR RIGHT_BRC var_decls opt_statements LEFT_BRC
    | identifier RIGHT_PAR param_list LEFT_PAR RIGHT_BRC var_decls opt_statements LEFT_BRC
    | modifier VOID identifier RIGHT_PAR param_list LEFT_PAR RIGHT_BRC var_decls opt_statements LEFT_BRC
    ;


var_decls:
    var_decls var_decl
    | var_decl
    | %empty
    ;

var_decl:
    type var_decl_list EROTIMATIKO
    | modifier type var_decl_list EROTIMATIKO
    ;

var_decl_list:
    var_decl_list COMMA var_assign
    | var_assign
    ;

var_assign:
    identifier EQUALS expression
    | identifier
    ;

modifier:
    PUBLIC
    | PRIVATE 
    ;

type:
    INT
    | CHAR
    | DOUBLE
    | BOOLEAN
    | STRING
    ;

param_list:
    param_list COMMA param
    | param
    | %empty
    ;

param:
    type identifier
    ;

opt_statements:
    statement_list
    | %empty /* empty */
    ;

statement_list:
    statement_list statement
    | statement
    ;

statement:
    var_decl
    | assignment
    | if_statement
    | while_statement
    | do_while_statement
    | for_statement
    | switch_statement
    | out_print
    | return_statement
    | break_statement
    ;

assignment:
    identifier EQUALS expression EROTIMATIKO | 
    identifier EQUALS expression 
    ;

if_statement:
    IF RIGHT_PAR expression LEFT_PAR RIGHT_BRC opt_statements LEFT_BRC opt_else
    ;

opt_else:
    ELSE RIGHT_BRC opt_statements LEFT_BRC
    | %empty /* empty */
    ;

while_statement:
    WHILE RIGHT_PAR expression LEFT_PAR RIGHT_PAR opt_statements LEFT_PAR
    ;

do_while_statement:
    DO RIGHT_BRC opt_statements LEFT_BRC WHILE RIGHT_PAR expression LEFT_PAR EROTIMATIKO
    ;

for_statement:
    FOR RIGHT_PAR type assignment expression EROTIMATIKO assignment LEFT_PAR RIGHT_BRC opt_statements LEFT_BRC
    ;

switch_statement:
    SWITCH RIGHT_PAR expression LEFT_PAR RIGHT_BRC case_list opt_default_case LEFT_BRC
    ;

case_list:
    case_list case_clause
    | case_clause
    ;

case_clause:
    CASE expression COLON opt_statements
    ;

opt_default_case:
    DEFAULT COLON opt_statements
    | %empty /* empty */
    ;

out_print:
    OUTPRINT RIGHT_PAR QT var_list QT LEFT_PAR EROTIMATIKO
    | OUTPRINTLN RIGHT_PAR QT var_list QT LEFT_PAR EROTIMATIKO
     |OUTPRINTLN RIGHT_PAR var_list LEFT_PAR EROTIMATIKO 
     | OUTPRINT RIGHT_PAR var_list LEFT_PAR EROTIMATIKO
    ;

var_list:
    var_list T_VAR
    | T_VAR
    ;

return_statement:
    RETURN expression EROTIMATIKO
    | RETURN EROTIMATIKO
    ;

break_statement:
    BREAK EROTIMATIKO
    ;

expression:
    expression PLUS expression
    | expression MINUS expression
    | expression STAR expression
    | expression SLASH expression
    | expression GREATER_THAN expression
    | expression LESS_THAN expression
    | expression GE_OP expression
    | expression LE_OP expression
    | expression EQ_OP expression
    | expression NE_OP expression
    | expression AND_OP expression
    | expression OR_OP expression
    | RIGHT_PAR expression LEFT_PAR
    | identifier
    | T_INTEGER
    | T_DOUBLE
    | T_STR
    ;

identifier:
    T_VAR
    ;

%%

int main(int argc, char *argv[]){

    /* If statement για να ελέγξει το αρχείο εισόδου */ 
    if(argc > 1){
        yyin = fopen(argv[1], "r");
        if (yyin == NULL){
            perror ("Σφάλμα ανοίγοντας το αρχείο"); return -1;
        }
    }
    /* Καλείται η συνάρτηση yyparse που επιστρέφει 0 αν το input einai έγκυρο
         και 1 εάν υπάρχει συντακικό λάθος*/
    yyparse(); 
    /* Κλείσιμο αρχείου εισόδου*/
    fclose(yyin);
    
    
    if(error_count > 0){
        printf("Η συντακτική ανάλυση απέτυχε! Βρέθηκαν %d σφάλματα\n", error_count);
    }else{
        printf("Η συντακτική ανάλυση ολοκληρώθηκε με επιτυχία! \nΔεν βρέθηκαν σφάλματα!\n");
    }
    return 0;
}


void yyerror(const char *message)
{
    /* Μετρητής για αριθμό σφαλμάτων */
    error_count++;
    
    if(flag_err_type==0){
        printf("-> Σφάλμα στη γραμμή %d που προέκυψε από %s : %s\n", yylineno, yytext, message);
    }
    flag_err_type = 0; // Reset flag_err_type 
}