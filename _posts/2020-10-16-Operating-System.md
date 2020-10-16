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
> Program Counter
>
> Current Instruction
>
> Registers
>
> ALU
>
> Control Unit

Direct Memory Access(DMA): CPU tells the DMA controller to initiate a transfer to free CPU from meaningless data copying and loading, leading to better performance. (More on interrupts later)(DMA is not completely free because it also occupies memory bus)

CPU always has priority over DMA because CPU is faster and doing meaningful things.

### Memory Hierarchy
> CPU > Cache > Memory > I/O device

