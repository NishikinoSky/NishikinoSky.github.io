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
