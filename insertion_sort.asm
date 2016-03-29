extern printf
SECTION .data
fmt:	db "%d %d %d %d %d", 10, 0

SECTION .text

global main

main:
		sub esp, 20
		mov dword [esp],  5
		mov dword [esp + 4], 3
		mov dword [esp + 8], 2
		mov dword [esp + 12], 4
		mov dword [esp + 16], 1

		mov ecx, 0
	loop_:
		mov ebx, dword [esp + ecx * 4]
		mov eax, ecx
		sub eax, 1
	innerloop_:
		cmp eax, 0
		jl change
		cmp dword [esp + eax * 4], ebx
		jl change
		mov edx, dword [esp + eax * 4]
		mov dword [esp + eax * 4 + 4], edx
		dec eax
		jmp innerloop_
	change:
		mov dword [esp + eax * 4 + 4], ebx
	continue_:
		inc ecx
		cmp ecx, 5
		jne loop_

		push dword fmt
		call printf
		add esp, 24

		mov eax, 0
		ret

