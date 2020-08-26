#include "asm_math.hpp"

float asm_math::asm_abs(float x)
{
    __asm
    {
        fld x
        fabs
        fstp x
    }
    return x;
}

float asm_math::asm_mod(float x, float y)
{
    __asm
    {
        fld y
        fld x
        fprem
        fstp x
        fstp y
    }
    return x;
}

float asm_math::asm_floor(float x)
{
    __asm
    {
        fld x
        frndint
        fstp x
    }
    return x;
}

float asm_math::asm_sqrt(float x)
{
    __asm
    {
        fld x
        fsqrt
        fstp x
    }
    return x;
}

float asm_math::asm_pow(float x, int y)
{
    __asm
    {
        mov eax, y
        fld x

        asm_loop:
            fmul x
            dec eax
            cmp eax, 1
            jne asm_loop
        
        fstp x
    }
    return x;
}

float asm_math::asm_sin(float x)
{
    __asm
    {
        fld x
        fsin
        fstp x
    }
    return x;
}

float asm_math::asm_cos(float x)
{
    __asm
    {
        fld x
        fcos
        fstp x
    }
    return x;
}

float asm_math::asm_tan(float x)
{
    __asm
    {
        fld x
        fptan
        fstp x
    }
    return x;
}

float asm_math::asm_atan(float x)
{
    __asm
    {
        fld x
        fpatan
        fstp x
    }
    return x;
}
