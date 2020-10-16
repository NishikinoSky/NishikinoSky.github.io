---
layout: post
title: Operating System
tags: OperatingSystem
stickie: false
---
操作系统，乃保安必修之阴间课，大二胜大三，次次早八，周周lab，恰逢申先生教改，毫无先辈遗迹可循；加上泉泉人反串作梗其中，期末岌岌可危矣。

👴痛作此文，一来查补疑难疏漏，二来明志自勉，以免挂科之危。

# 2020.9.16~9.18

### Von-Neumann Model
CPU-->Memory & I/O

### Memory
Data stored in memory and each byte is labeled by a unique address.

### CPU
Program Counter  |  Current Instruction  |  Registers  |  ALU  |  Control Unit

Fetch-Decode-Execute cycle

Direct Memory Access(DMA): CPU tells the DMA controller to initiate a transfer to free CPU from meaningless data copying and loading, leading to better performance. (More on interrupts later)(DMA is not completely free because it also occupies memory bus)

CPU always has priority over DMA because CPU is faster and always does meaningful things.

### Memory Hierarchy
Speed: CPU > Cache > Memory > I/O device

Why caching works？
> Temporal Locality: a program tends to reference address it has recently referenced.
>
> Spatial Locality: a program tends to reference address next to addresses it has recently referenced.

### Multi-core Chips

### OS
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

### Multi-Programming
Context-switch

Time-Sharing: Multi-programming with rapid context-switching.

In modern OSes, jobs are called processes, which mean running programs.

### You can play with them :)
[LinuxKernel](https://www.kernel.org/)

[GithubLinux](https://github.com/torvalds/linux)
