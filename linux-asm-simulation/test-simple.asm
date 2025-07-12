; Teste super simples para FPGA
jmp Main

Main:
    ; Imprime um caractere na posição 500
    loadn r0, #500
    loadn r1, #'H'
    outchar r1, r0
    
    ; Imprime outro caractere na posição 501
    loadn r0, #501
    loadn r1, #'I'
    outchar r1, r0
    
    ; Para o programa
    halt
