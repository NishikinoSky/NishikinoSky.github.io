---
layout: post
title: x86处理器汇编
tags:
stickie: false
---

参考书：《汇编语言 基于x86处理器》7th

# Chapter 3 基础概念

## 基本语言元素

保留字（reserved word） 标识符（identifier） 

伪指令（directive）

指令（instruction）：标号（laber） 指令助记符（instruction mnemonic） 操作数（operand）

## 伪指令

.model flat, stdcall ;规定汇编程序采用的存储模式。flat表示32位程序使用平面存储模式，stdcall规定子程序调用规范

.stack 4096 ;表示程序运行时堆栈保留4096内存字节

## 定义数据

[name] directive initializer [,initializer]

### BYTE SBYTE 数据

    value1 BYTE 255

    value2 SBYTE -128 ; BYTE定义字节，SBYTE定义有符号字节，且初始值必须为8位

    value3 DB 255

    value4 DB -128 ;DB 也可定义有符号或者无符号的8位变量

    value BYTE ? ; ?初始值使得变量未初始化 

### 多初始值

    list BYTE 10,20,30

         BYTE 40,50,60
     
         BYTE 70,80,90
         
假设list偏移量为0000，则10的偏移量为0000，20为0001……

### 定义字符串

用单/双引号，结尾用空字节0标记

    string BYTE 'Hello',0 ; 每个字符占一个字节，等价于string BYTE 'H','e','l','l','o'

十六进制代码 0dh,0ah 为回车换行符

    string BYTE 'Hello,',odh,oah
    
           BYTE 'my friend.',odh,oah,0
           
行连续符 \ 把两行代码连成一条语句，必须是一行的最后一个字符

### DUP 操作符

        BYTE 20 DUP(0) ; 20个值为0的字节
        
        BYTE 20 DUP(?) ; 20个未初始化的字节
        
### WORD SWORD 数据

word1 WORD 65535

word2 SWORD -32768 ; 为16位整数分配空间

同样可以用 DW 定义有符号或无符号

多初始值时偏移量为2

### DWORD SDWORD 数据

为32位整数分配空间

同样可用 DD 定义有符号或者无符号

偏移量为4

QWORD  SQWORD 为4字，也可用DQ

### 浮点类型

REAL4 4字节单精度

REAL8 8字节双精度

REAL10 10字节扩展精度

    rval1 REAL4 -1.2 ; rval1 DD -1.2
    
    rval2 REAL8 3.2E-260 ; rval2 DQ 3.2E-260
    
    rval3 REAL10 4.6E+4096 ; rval3 DT 4.6E+4096
    
DD 短实数

DQ 长实数

DT 扩展精度实数

### 小端顺序

x86处理器按照小端顺序从低到高存放数据

### 声明未初始化数据

.data ? ; 若此处未加 ? 则编译后程序会多出2000个字节

bigArray DWORD 5000 DUP(?) 

## 符号常量

symbolic constant 不使用内存，运行时不改变值

### 等号伪指令

name = expression

通常expression为一个32位整数，代替name

### 当前地址计数器 $

list BYTE 10,20,30,40

ListSize = ($ - list) ; 计算list数组大小，该语句必须跟在list后面；若数组为多字节类型，则要除单个元大小

### EQU 伪指令

把一个符号名称与一个整数表达式或任意文本连接

    name EQU expression

    name EQU symbol ; symbol必须是以及定义的符号名称

    name EQU <test> ; 用<>中的文本或整数值来代替name，文本为直接复制

### TESTEQU 伪指令

创建文本宏（text macro）

    name TEXTEQU <text> ; 创建文本宏
    
    name TEXTEQU textmacro ; 已定义文本宏传递
    
    name TEXTEQU %constExpr
    
# Chapter 4 数据传送、寻址和算术运算

