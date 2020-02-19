# PURPOSE:  simple program that exits and returns a status code
#           back to the Linux kernel

# INPUT:    None
#

# OUTPUT:   returns a status code. This can be viewed by typing
#
#           echo $?
#
#           after running the program
#

# VARIABLES:
#           %eax holds the system call number (this is always the case)
#           %ebx holds the return status
#

.section .data

.section .text

.globl _start
_start:
 mov $1, %eax       # this is the linux kernel command number (system call ) for exiting a program
 movl $0, %ebx      # this is the status number we will return to the operating system.
 int $0x80          # this wakes up the kernel to run the exit command