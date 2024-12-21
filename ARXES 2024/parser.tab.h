/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PUBLIC = 258,                  /* PUBLIC  */
    PRIVATE = 259,                 /* PRIVATE  */
    VOID = 260,                    /* VOID  */
    INT = 261,                     /* INT  */
    CHAR = 262,                    /* CHAR  */
    DOUBLE = 263,                  /* DOUBLE  */
    BOOLEAN = 264,                 /* BOOLEAN  */
    STRING = 265,                  /* STRING  */
    CLASS = 266,                   /* CLASS  */
    NEW = 267,                     /* NEW  */
    RETURN = 268,                  /* RETURN  */
    IF = 269,                      /* IF  */
    ELSE = 270,                    /* ELSE  */
    WHILE = 271,                   /* WHILE  */
    DO = 272,                      /* DO  */
    FOR = 273,                     /* FOR  */
    SWITCH = 274,                  /* SWITCH  */
    CASE = 275,                    /* CASE  */
    DEFAULT = 276,                 /* DEFAULT  */
    BREAK = 277,                   /* BREAK  */
    TRUE = 278,                    /* TRUE  */
    FALSE = 279,                   /* FALSE  */
    OUTPRINT = 280,                /* OUTPRINT  */
    OUTPRINTLN = 281,              /* OUTPRINTLN  */
    EQ_OP = 282,                   /* EQ_OP  */
    COLON = 283,                   /* COLON  */
    NE_OP = 284,                   /* NE_OP  */
    GE_OP = 285,                   /* GE_OP  */
    LE_OP = 286,                   /* LE_OP  */
    AND_OP = 287,                  /* AND_OP  */
    OR_OP = 288,                   /* OR_OP  */
    EROTIMATIKO = 289,             /* EROTIMATIKO  */
    COMMA = 290,                   /* COMMA  */
    EQUALS = 291,                  /* EQUALS  */
    GREATER_THAN = 292,            /* GREATER_THAN  */
    LESS_THAN = 293,               /* LESS_THAN  */
    PLUS = 294,                    /* PLUS  */
    MINUS = 295,                   /* MINUS  */
    STAR = 296,                    /* STAR  */
    SLASH = 297,                   /* SLASH  */
    T_VAR = 298,                   /* T_VAR  */
    T_INTEGER = 299,               /* T_INTEGER  */
    T_DOUBLE = 300,                /* T_DOUBLE  */
    T_STR = 301,                   /* T_STR  */
    T_INTEGER_STRING = 302,        /* T_INTEGER_STRING  */
    LEFT_PAR = 303,                /* LEFT_PAR  */
    RIGHT_PAR = 304,               /* RIGHT_PAR  */
    LEFT_BRC = 305,                /* LEFT_BRC  */
    RIGHT_BRC = 306,               /* RIGHT_BRC  */
    QT = 307                       /* QT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
