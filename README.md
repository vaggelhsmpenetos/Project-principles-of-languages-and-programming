# Programming Languages & Compiler Design — Lexical and Syntax Analyzer

## Project Overview

This project was developed as part of the **Programming Languages & Compiler Design** course at the **Department of Computer Engineering and Informatics, University of Patras**.

The main goal of the project was to gain practical experience with fundamental concepts of **programming language design and compiler construction** by designing and implementing a lexical and syntax analyzer for a custom object-oriented programming language.

The project starts with the formal definition of the language grammar using **BNF (Backus–Naur Form)** and proceeds to the implementation of a **lexical analyzer using Flex** and a **syntax analyzer using Bison**.

The final analyzer accepts source-code files written in the custom programming language and checks whether they follow the defined lexical, syntactic, and additional semantic rules.

---

## Project Objectives

The main objectives of the project were:

- Define the grammar of a custom programming language using **BNF**.
- Implement a **lexical analyzer** using Flex.
- Implement a **syntax analyzer / parser** using Bison.
- Recognize and validate the different constructs of the programming language.
- Detect and report syntax errors in source-code files.
- Check whether variables and methods are correctly declared and used.
- Handle variable and method **scope**.
- Evaluate arithmetic expressions and variable assignments.
- Implement error handling and recovery mechanisms.

---

## The Custom Programming Language

The language analyzed in this project is a fictional **object-oriented programming language inspired by Java**.

Programs are organized into one or more classes and support several fundamental object-oriented and programming language constructs, including:

- Classes and nested classes
- Variables and methods
- Primitive and non-primitive data types
- Public and private access modifiers
- Object creation
- Method calls
- Variable assignments
- Arithmetic expressions
- Conditional statements
- Loop statements
- Return statements
- Break statements
- Output statements
- Single-line and multi-line comments

The language is **case-sensitive** and follows a predefined lexical and syntactic specification.

---

## Classes and Methods

Each program consists of one or more classes. A class can also contain another class.

A basic class follows the structure:

```text
public class ClassName {
    // variable declarations
    // method declarations
}
