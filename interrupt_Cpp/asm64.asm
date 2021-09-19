
.data
msgCaption	db "Message Box Text 64Bit.", 0

.code
ALIGN 16

EXTERN GetMsgBoxType : PROC
;EXTERN MessageBoxA : PROC
EXTERN __imp_MessageBoxA : QWORD

asm_func PROC
	sub rsp, 28h
	mov	[rsp], rcx

	call GetMsgBoxType

	mov	r9, rax
	mov r8, [rsp]
	lea	rdx, [msgCaption]
	xor ecx, ecx

	call [__imp_MessageBoxA]

	add	rsp, 28h
	ret
asm_func ENDP

END