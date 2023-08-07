.code	

abs proc
    sub         rsp, 16

    movups      [rsp], xmm0

    fld         dword ptr [rsp]

    fabs    

    fstp        dword ptr [rsp]

    mov         rax, [rsp]

    add         rsp, 16
    ret 
abs endp  

modulo proc
    sub         rsp, 32

    movups      dword ptr [rsp], xmm0
    movups      dword ptr [rsp+16], xmm1

    fld         dword ptr [rsp+16]
    fld         dword ptr [rsp]

    fprem      
    
    fstp        dword ptr [rsp]
    fstp        ST(0)

    movups      xmm0, dword ptr [rsp]
    
    add         rsp, 32 

    ret 
modulo endp  

ceil proc
    vroundss    xmm0, xmm0, xmm0, 2h
    ret 
ceil endp  

floor proc
    vroundss    xmm0, xmm0, xmm0, 1h
    ret 
floor endp  

round proc
    vroundss    xmm0, xmm0, xmm0, 0h
    ret 
round endp  

sqrt proc 
    vsqrtss     xmm0, xmm0, xmm0
    ret
sqrt endp	

pow proc
    mov         rcx, rdx
    dec         rcx 
    movss       xmm1, xmm0
    asm_loop:
        mulss   xmm0, xmm1
        loop    asm_loop
        ret 
pow endp  

sin proc
    sub         rsp, 16        
    movups      dword ptr [rsp], xmm0    
    fld         dword ptr [rsp]
    fsin                       
    fstp        dword ptr [rsp]
    movups      xmm0, [rsp]    
    add         rsp, 16        
    ret
sin endp

cos proc
    sub         rsp, 16        
    movups      dword ptr [rsp], xmm0    
    fld         dword ptr [rsp]
    fcos                       
    fstp        dword ptr [rsp]
    movups      xmm0, [rsp]    
    add         rsp, 16        
    ret
cos endp

tan proc
    sub         rsp, 16        
    movups      dword ptr [rsp], xmm0    
    fld         dword ptr [rsp] 
    fptan                      
    fstp        ST(0)
    fstp        dword ptr [rsp]
    movups      xmm0, [rsp]    
    add         rsp, 16        
    ret
tan endp

atan proc
    sub         rsp, 16       
    
    movups      dword ptr [rsp], xmm0    
    
    fld1
    fld         dword ptr [rsp]
    
    fpatan                     
    
    fstp        dword ptr [rsp]
    fstp        ST(0)
    
    movups      xmm0, [rsp]    
    
    add         rsp, 16       
    ret
atan endp

end
