---
layout: post
title: Operating System
tags: OperatingSystem
stickie: false
---
操作系统，乃保安必修之阴间课，大二胜大三，次次早八，周周lab，恰逢申先生教改，无先辈牙慧可拾、遗迹可循；何况泉泉人反串作梗其中，期末岌岌可危矣。

故👴痛作此文，一来查补疑难疏漏，二来明志自勉，以免挂科之危。

# 2020.9.23 & 9.25

## OS Structures

### #OS Events
Two kinds of events: Interrupts and Traps
> Interrupts are caused by external events; Hardware generated.
>
> Traps are caused by executing instructions; Software generated.

### #System Calls
A system call is a special kind of trap for a user program to do something privileged.

Mostly accessed by programs via a high-level Application Programming Interface (API).

Time spent in syscalls: realtime & user time(user mode) & system time(kernel mode)

Typically, a number is associated with each system call and System-call interface maintains an index table according to these numbers. Kernel just looks up the table for the number, finds the entrance and excutes it.

Syscall will transfer the control flow from user to kernel.

System Call Parameter Passing: Parameters stored in a block, or table, in memory, and address of block passed as a parameter in a register.

### #Timers
CPU need to know how much time a program has used CPU resource. The timer interrupts the
computer regularly.(A special kind of interrupt)

### #Main OS Services
> Process Management
>
> Memory Management
>
> Storage Management
>
> I/O Management
>
> Protection and Security

A process is a program in execution
> Program: passive entity
>
> Process: active entity

Memory management determines what is in memory when.

### #OS Services
Helpful to users: program execution / I/O operations / file systems / communication / error detection

Better efficiency/operation: resource allocation / accounting / protection and security

### #System Services


### #User Operating System Interface
>CLI
>>Shell: knows how to run command
>
>GUI
>
>Batch


# 2020.9.16 & 9.18

## Intro

### #Von-Neumann Model
CPU-->Memory & I/O

### #Memory
Data stored in memory and each byte is labeled by a unique address.

### #CPU
Program Counter  |  Current Instruction  |  Registers  |  ALU  |  Control Unit

Fetch-Decode-Execute cycle

Direct Memory Access(DMA): CPU tells the DMA controller to initiate a transfer to free CPU from meaningless data copying and loading, leading to better performance. (More on interrupts later)(DMA is not completely free because it also occupies memory bus)

CPU always has priority over DMA because CPU is faster and always does meaningful things.

### #Memory Hierarchy
Speed: CPU > Cache > Memory > I/O device

Why caching works？
> Temporal Locality: a program tends to reference address it has recently referenced.
>
> Spatial Locality: a program tends to reference address next to addresses it has recently referenced.

### #Multi-core Chips

### #OS
Applications->OS->Hardware

OS is a resource abstractor and allocator. It decides who (which running program) gets what resource (share) and when.

How to start an OS?
> The bootstrap program stored in ROM initializes the computer.
>
> Then locates and loads the OS kernel into memory.
>
> The kernel starts the first process (called “init” on Linux).
>
> Then nothing happens until an event occurs.

### #Multi-Programming
Context-switch

Time-Sharing: Multi-programming with rapid context-switching.

In modern OSes, jobs are called processes, which mean running programs.

### #User&Kernel Mode

### #Control Flow 
Control flow(or flow of control) is the order in which individual statements, instructions or function calls of an program are executed.

### #You can play with them :)
[LinuxKernel](https://www.kernel.org/)

[GithubLinux](https://github.com/torvalds/linux)
