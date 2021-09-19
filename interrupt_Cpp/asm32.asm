.686p
.model flat, C

.data
msgCaption	db	"Message Box Taxt  32Bit.", 0


.code
ALIGN 8

EXTERN _imp__MessageBoxA@16 : DWORD
EXTERN GetMsgBoxType : PROC

OPTION LANGUAGE: SYSCALL
@asm_func@4 PROC
	;ECX = address for the string for the message box
	push	ecx

	call	GetMsgBoxType

	pop		ecx
	pop		edx					;Return address

	push	eax					;	uType
	lea		eax, [msgCaption]
	push	eax					;	lpCaption
	push	ecx					;	lpText
	push	0					;	hwnd

	push	edx					;	return address
	jmp		[_imp__MessageBoxA@16]
@asm_func@4 ENDP
OPTION LANGUAGE: C

END