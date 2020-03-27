# PURPOSE - Given a number, this program computes the
#			factorial. For example, the factorial of
#			3 is 3 * 2 * 1, or 6. The factorial of
#			4 is 4 * 3 * 2 * 1, or 24, and so on.

.section .data

.section .text

.globl _start
.globl factorial

_start:
pushl $4			# the factorial takes one argument - the number
					# we want a factorial of. So it gets pushed
call factorial  	# run the factorial function
popl %ebx			# pop what was pushed
movl %eax, %ebx		# factorial returns the answer in %eax, but we
					# want it in %ebx to send it as out exit status
movl $1, %eax 		# call the kernel's exit function
int $0x80

# this is the factorial function
.type factorial,@function
factorial:
pushl %ebp			# restore %ebp to its prior state
movl %esp, %ebp		
movl 8(%ebp), %eax  # moves the first argument into %eax
cmpl $1, %eax       # if the number is 1, that is our base case, and we return
je end_factorial
decl %eax 			# otherwise, decrease the value
pushl %eax 			# push it for our next call to factorial
call factorial      # call factorial
popl %ebx			
incl %ebx			
imul %ebx, %eax   	# multiply by the last call to factorial
end_factorial:
movl %ebp, %esp		# restore %ebp and %esp
popl %ebp
ret 