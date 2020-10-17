---
layout: post
title: Operating System
tags: OperatingSystem
stickie: false
---
操作系统，乃保安必修之阴间课，大二胜大三，次次早八，周周lab，恰逢申先生教改，尚无先辈牙慧可拾、遗迹可循；何况泉泉人反串作梗其中，期末岌岌可危矣。

故👴痛作此文，一来查补疑难疏漏，二来明志自勉，以免挂科之危。

# 2020.9.30 & 10.9

## Processes

### #Process Concept
A process is a program in execution.

Program is a passive entity and it becomes a process when it's loaded into memory.

Process = code(text) + program counter(points to the next instruction to execut) + registers + runtime stack + data section + heap

stack-> | <-heap | data | text

### #The Runtime Stack
The runtime stack is a stack on which items can be pushed or popped.

Activation Record: Before calling a function, we need to save some information like the return address, parameters, local variables, the value returned by function, the state of registers. All the above goes on the stack as part of activation records, which grows downward.

### #Process State
New:  The process is being created
Running:  Instructions are being executed
Waiting:  The process is waiting for some event to occur
Ready:  The process is waiting to be assigned to a processor
Terminated:  The process has finished execution

### #Process Control Block (PCB)
It stores information associated with each process.

### #New: Process Creation
A process may create new processes, in which case it becomes a parent, then we obtain a tree of processes and each process has a pid(ppid refers to the parents' pid).

The child may inherit/share some of the resources of its parent, or may have entirely new ones and a parent can also pass input to a child

### #fork() Syscall
fork() creates a new process which is a copy of its parent but they have different pids and its resource utilization is set to 0. And both processes continue execution after the call to fork().

fork() returns the child’s pid to the parent, and 0 to the child

>Each process can find its own pid with the getpid() call, and its ppid with the getppid() call

You can draw a picture to analyze the state of process when executing a program.

exec() system call used after a fork() to replace the process’ memory space with a new program and parent process calls wait() for the child to terminate.

### #Process Terminations

A process terminates itself with the exit() system call and all resources of a process are deallocated by the OS.

A process can cause the termination of another process using something called “signals” and the kill() system call.

A parent can call wait() syscall to wait for a child to complete. It blocks until any child completes and returns the pid of the completed child and the child’s exit code.

### #Signal

### #Process Scheduling
Process scheduler selects among available processes for next execution on CPU core.

Schedulling queues

>Ready queue –set of all processes residing in main memory, ready and waiting to execute
>
>Wait queue –set of processes waiting for an event (i.e. I/O)

### #Context Switch
A context switch occurs when the CPU switches from one process to another.

Use PCB to save and load states of different processes.

### #Zombie
They’re dead, but alive.



# 2020.9.27

## OS Structures

## #Why Applications are Operating System Specific
Because each operating system provides its own unique system calls.

Application Binary Interface (ABI): architecture equivalent of API, defines how different components of binary code can interface for a given operating system on a given architecture, CPU, etc.

## #Operating System Design and Implementation
Policy: What will be done? | Mechanism: How to do it?

> Taking door as an example, policy is determining who can get in the door while mechanism is the way to enforce policy.

An important principle: The separation of policy from mechanism

## #Implementation


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

### #Linkers and Loaders
Relocatable object file: Source code compiled into object files designed to be loaded into any physical memory location.

Linker combines these object files into single binary executable file and also brings in libraries.

Loader bring executable file into memory to be executed.

Modern general purpose systems don’t link libraries into executables, but dynamically linked libraries are loaded as needed, which is called DLLs in Windows.

> Source program + compiler = object file
>
> Object file + other object files + linker = executable file
>
> executable file + loader = program in memory
>
> main.c (gcc -c)-> main.o (gcc -o)-> main

### #ELF
ELF: Executable and Linkable Format

ELF includes ELF header, Program header table, .text, .rodata, .data, .bass, Section header table.

> Program header table and section header table are for Linker and Loader
>
> .text: code
>
> .rodata: initialized read-only data (where static const goes)
>
> .data: initialized data (where static variable goes)
>
> .bss: uninitialized data

ELF file mapping

Kernel space | Stack -> | <- Heap | Bss segment | Data segment | Text segment (ELF)

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


# You can play with them :)
[LinuxKernel](https://www.kernel.org/)

[GithubLinux](https://github.com/torvalds/linux)
