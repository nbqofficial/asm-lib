#pragma once

namespace asm_math {
	extern "C" float asm_abs(float x);

	extern "C" float asm_mod(float x, float y);

	extern "C" float asm_ceil(float x);

	extern "C" float asm_floor(float x);

	extern "C" float asm_round(float x);

	extern "C" float asm_sqrt(float x);

	extern "C" float asm_pow(float x, int y);

	/**
	* Calculates a sine for a given number.
	* 
	* @param[in] x The number which the sine will be calculated for.
	* @returns The sine in radians.
	*/
	extern "C" float asm_sin(float x);

	/**
	* Calculates a cosine for a given number.
	*
	* @param[in] x The number which the cosine will be calculated for.
	* @returns The cosine in radians.
	*/
	extern "C" float asm_cos(float x);

	/**
	* Calculates a tangent for a given number.
	*
	* @param[in] x The number which the tangent will be calculated for.
	* @returns The tangent in radians.
	*/
	extern "C" float asm_tan(float x);

	/**
	* Calculates an inverse tangent for a given number.
	*
	* @param[in] x The number which the inverse tangent will be calculated for.
	* @returns The inverse tangent in radians.
	*/
	extern "C" float asm_atan(float x);
}