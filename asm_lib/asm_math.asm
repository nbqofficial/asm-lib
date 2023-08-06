.code	

asm_abs proc
    sub         rsp, 16

    movups      [rsp], xmm0

    fld         dword ptr [rsp]

    fabs    

    fstp        dword ptr [rsp]

    movups      xmm0, [rsp]

    add         rsp, 16
    ret 
asm_abs endp  

asm_mod proc
    sub         rsp, 32

    movups      dword ptr [rsp], xmm0
    movups      dword ptr [rsp+16], xmm1

    fld         dword ptr [rsp+16]
    fld         dword ptr [rsp]

    fprem      
    
    fstp        dword ptr [rsp]
    fstp        ST(1)                                   ; Clear ST(1) where we store the divisor

    movups      xmm0, dword ptr [rsp]
    
    add         rsp, 32 

    ret 
asm_mod endp  

asm_ceil proc
    vroundss    xmm0, xmm0, xmm0, 2h
    ret 
asm_ceil endp  

asm_floor proc
    vroundss    xmm0, xmm0, xmm0, 1h
    ret 
asm_floor endp  

asm_round proc
    vroundss    xmm0, xmm0, xmm0, 0h
    ret 
asm_round endp  

asm_sqrt proc 
    vsqrtss     xmm0, xmm0, xmm0
    ret
asm_sqrt endp	

asm_pow proc
    mov         rcx, rdx
    dec         rcx 
    movss       xmm1, xmm0
    asm_loop:
        mulss   xmm0, xmm1
        loop    asm_loop
        ret 
asm_pow endp  

asm_sin proc
    sub         rsp, 16        
    movups      dword ptr [rsp], xmm0    
    fld         dword ptr [rsp]
    fsin                       
    fstp        dword ptr [rsp]
    movups      xmm0, [rsp]    
    add         rsp, 16        
    ret
asm_sin endp

asm_cos proc
    sub         rsp, 16        
    movups      dword ptr [rsp], xmm0    
    fld         dword ptr [rsp]
    fcos                       
    fstp        dword ptr [rsp]
    movups      xmm0, [rsp]    
    add         rsp, 16        
    ret
asm_cos endp

asm_tan proc
    sub         rsp, 16        
    movups      dword ptr [rsp], xmm0    
    fld         dword ptr [rsp] 
    fptan                      
    fstp        ST(0)                                   ; Skip over the first value on the FPU stack, because fptan pushes 1.0 onto the stack and stores the result in ST(1)...
    fstp        dword ptr [rsp]
    movups      xmm0, [rsp]    
    add         rsp, 16        
    ret
asm_tan endp

asm_atan proc
    sub         rsp, 16         
    movups      dword ptr [rsp], xmm0    
    fld1
    fld         dword ptr [rsp]
    fpatan                     
    fstp        dword ptr [rsp]
    movups      xmm0, [rsp]    
    add         rsp, 16       
    ret
asm_atan endp

end
