#include <Windows.h>
#include <iostream>
#include <conio.h>

#include "asm_math.hpp"

int main() {	
	srand(time(NULL));
	for (auto i = 0u; i < 10000; ++i) {
		float a = (rand() % 1000) + 1;
		float b = (rand() % 1000) + 1;
		int cpp_mod = (int)a % (int)b;
		float asm_mod = asm_math::asm_mod(a, b);
		printf("C++ Modulo:  %d\n", cpp_mod);
		printf("ASM Modulo:  %f\n", asm_mod);
		if (cpp_mod != asm_mod) {
			printf("C++ Modulo doesnt match the ASM modulo, stopping at iteration %ud with a: %f and b: %f!\n", i, a, b);
			Sleep(10'000);
			break;
		}
	}
	(void)_getch();
	return 0;
}