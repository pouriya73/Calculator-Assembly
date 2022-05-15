# Calculator-Assembly

## Remarks

Assembly is a general name used for many human-readable forms of machine code. It naturally differs a lot between different CPUs (Central Processing Unit), but also on single CPU there may exist several incompatible dialects of Assembly, each compiled by different assembler, into the identical machine code defined by the CPU creator.

If you want to ask question about your own Assembly problem, always state what HW and which assembler you are using, otherwise it will be difficult to answer your question in detail.

Learning Assembly of single particular CPU will help to learn basics on different CPU, but every HW architecture can have considerable differences in details, so learning ASM for new platform can be close to learning it from scratch.


## Introduction

Assembly language is a human readable form of machine language or machine code which is the actual sequence of bits and bytes on which the processor logic operates. It is generally easier for humans to read and program in mnemonics than binary, octal or hex, so humans typically write code in assembly language and then use one or more programs to convert it into the machine language format understood by the processor.

```asm
mov eax, 4
cmp eax, 5
je point
```

An assembler is a program that reads the assembly language program, parses it, and produces the corresponding machine language. It is important to understand that unlike a language like C++ that is a single language defined in standard document, there are many different assembly languages. Each processor architecture, ARM, MIPS, x86, etc has a different machine code and thus a different assembly language. Additionally, there are sometimes multiple different assembly languages for the same processor architecture. In particular, the x86 processor family has two popular formats which are often referred to as gas syntax (gas is the name of the executable for the GNU Assembler) and Intel syntax (named after the originator of the x86 processor family). They are different but equivalent in that one can typically write any given program in either syntax.

Generally, the inventor of the processor documents the processor and its machine code and creates an assembly language. It's common for that particular assembly language to be the only one used, but unlike compiler writers attempting to conform to a language standard, the assembly language defined by the inventor of the processor is usually but not always the version used by the people who write assemblers.


## There are two general types of processors:

CISC (Complex Instruction Set Computer): have many different and often complex machine language instructions

RISC (Reduced Instruction set Computers): by contrast, has fewer and simpler instructions

For an assembly language programmer, the difference is that a CISC processor may have a great many instructions to learn but there are often instructions suited for a particular task, while RISC processors have fewer and simpler instructions but any given operation may require the assembly language programmer to write more instructions to get the same thing done.

Other programming languages compilers sometimes produce assembler first, which is then compiled into machine code by calling an assembler. For example, gcc using its own gas assembler in final stage of compilation. Produced machine code is often stored in object files, which can be linked into executable by the linker program.

A complete "toolchain" often consists of a compiler, assembler and linker. One can then use that assembler and linker directly to write programs in assembly language. In the GNU world the binutils package contains the assembler and linker and related tools; those who are solely interested in assembly language programming do not need gcc or other compiler packages.

Small microcontrollers are often programmed purely in assembly language or in a combination of assembly language and one or more higher level languages such as C or C++. This is done because one can often use the particular aspects of the instruction set architecture for such devices to write more compact, efficient code than would be possible in a higher level language and such devices often have limited memory and registers. Many microprocessors are used in embedded systems which are devices other than general purpose computers that happen to have a microprocessor inside. Examples of such embedded systems are televisions, microwave ovens and the engine control unit of a modern automobile. Many such devices have no keyboard or screen, so a programmer generally writes the program on a general purpose computer, runs a cross-assembler (so called because this kind of assembler produces code for a different kind of processor than the one on which it runs) and/or a cross-compiler and cross linker to produce machine code.

There are many vendors for such tools, which are as varied as the processors for which they produce code. Many, but not all processors also have an open source solution like GNU, sdcc, llvm or other.


## Hello world for Linux x86_64 (Intel 64 bit)

```asm
section .data
    msg db "Hello world!",10      ; 10 is the ASCII code for a new line (LF)

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 13
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall
 ```
 
 ## Hello World for OS X (x86_64, Intel syntax gas)
 
 ```asm
 .intel_syntax noprefix

.data

.align 16
hello_msg:
    .asciz "Hello, World!"

.text

.global _main
_main:
    push rbp
    mov rbp, rsp

    lea rdi, [rip+hello_msg]
    call _puts

    xor rax, rax
    leave
    ret
 ```
 
 ## Machine code
 
Machine code is term for the data in particular native machine format, which are directly processed by the machine - usually by the processor called CPU (Central Processing Unit).

Common computer architecture (von Neumann architecture) consist of general purpose processor (CPU), general purpose memory - storing both program (ROM/RAM) and processed data and input and output devices (I/O devices).

The major advantage of this architecture is relative simplicity and universality of each of components - when compared to computer machines before (with hard-wired program in the machine construction), or competing architectures (for example the Harvard architecture separating memory of program from memory of data). Disadvantage is a bit worse general performance. Over long run the universality allowed for flexible usage, which usually outweighed the performance cost.

## How does this relate to machine code?

Program and data are stored in these computers as numbers, in the memory. There's no genuine way to tell apart code from data, so the operating systems and machine operators give the CPU hints, at which entry point of memory starts the program, after loading all the numbers into memory. The CPU then reads the instruction (number) stored at entry point, and processing it rigorously, sequentially reading next numbers as further instructions, unless the program itself tells CPU to continue with execution elsewhere.

For example a two 8 bit numbers (8 bits grouped together are equal to 1 byte, that's an unsigned integer number within 0-255 range): 60 201 , when executed as code on Zilog Z80 CPU will be processed as two instructions: INC a (incrementing value in register a by one) and RET (returning from sub-routine, pointing CPU to execute instructions from different part of memory).

To define this program a human can enter those numbers by some memory/file editor, for example in hex-editor as two bytes: 3C C9 (decimal numbers 60 and 201 written in base 16 encoding). That would be programming in machine code.

To make the task of CPU programming easier for humans, an Assembler programs were created, capable to read text file containing something like:

