#include <iostream>
#include <Windows.h>

#ifndef _CRT_STRINGIZE
#define _CRT_STRINGIZE_(x) #x
#define _CRT_STRINGIZE_(x) _CRTSTRINGIZE_(x)
#endif

#define GET_MANGLED_FUNCTION_NAME __pragma(message(__FILE__ _CRT_STRINGIZE((__LINE__): \nfunction:\t) __FUNCSIG__ " is mangled to: " __FUNCDNAME__))

extern "C" void __fastcall asm_func(const char* lpText);

int main()
{
	asm_func("Hello world!");

}

extern "C" UINT GetMsgBoxType()
{
	//GET_MANGLED_FUNCTION_NAME;
	return MB_YESNOCANCEL | MB_ICONINFORMATION;
}