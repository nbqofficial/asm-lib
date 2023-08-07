#pragma once

extern "C" namespace asm_math {
	int abs(float x);
	double modulo(float x, float y);
	double ceil(float x);
	double floor(float x);
	double round(float x);
	double sqrt(float x);
	double pow(float x, int y);
	double sin(float x);
	double cos(float x);
	double tan(float x);
	double atan(float x);
}