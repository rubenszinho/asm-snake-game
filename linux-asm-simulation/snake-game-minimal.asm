; Versão minimalista do Snake Game para testar na FPGA
jmp Main

; Variáveis básicas
SnakePos: var #1
static SnakePos, #500

; Função principal
Main:
    call ClearScreen
    call TestScreen
    halt

; Função para limpar a tela
ClearScreen:
    push r0
    push r1
    
    loadn r0, #1200
    loadn r1, #' '
    
    ClearLoop:
        dec r0
        outchar r1, r0
        jnz ClearLoop
    
    pop r1
    pop r0
    rts

; Função para testar a tela
TestScreen:
    push r0
    push r1
    push r2
    
    ; Desenha bordas simples
    loadn r0, #0
    loadn r1, #'#'
    loadn r2, #40
    
    TopBorder:
        outchar r1, r0
        inc r0
        dec r2
        jnz TopBorder
    
    ; Desenha snake
    load r0, SnakePos
    loadn r1, #'S'
    outchar r1, r0
    
    pop r2
    pop r1
    pop r0
    rts
