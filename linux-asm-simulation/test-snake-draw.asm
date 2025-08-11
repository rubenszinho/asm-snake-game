jmp main

SnakePos: var #1
Length: var #1
SnakeBody: var #10

static SnakePos, #700
static Length, #3

main:
    ; Limpa a tela
    loadn r0, #0
    loadn r1, #' '
    TestClearLoop:
        outchar r1, r0
        inc r0
        loadn r2, #1200
        cmp r0, r2
        jle TestClearLoop
    
    ; Testa desenho da cobra
    call DrawSnake
    
    ; Loop infinito
    TestEnd:
        jmp TestEnd

DrawSnake:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6

    loadn r1, #'G'             ; Usa G para representar a cobra
    loadn r5, #' '             ; Também carrega ' ' para apagar o corpo
    load r0, SnakePos          ; Carrega a posição da cobra em R0
    loadn r2, #SnakeBody       ; Carrega o endereço da primeira posição do corpo da cobra
    loadn r4, #0               ; Carrega 0 e Length para o loop do corpo
    load r6, Length

    DrawSnakeLoop:
        loadi r3, r2           ; Carrega a posição anterior do corpo da cobra
        outchar r1, r0         ; Imprime a posição atual da cobra
        outchar r5, r3         ; Apaga a posição anterior
        loadn r1, #'O'         ; Define o corpo com o caractere 'O' após o primeiro loop
        storei r2, r0          ; Armazena a posição atual no vetor SnakeBody
        mov r0, r3             ; Atualiza a posição atual para a próxima iteração
        cmp r4, r6             ; Verifica se todos os segmentos da cobra foram impressos
        jeq DrawSnakeEnd       ; Se todos foram impressos, termina a rotina
        inc r4
        inc r2
        jmp DrawSnakeLoop

    DrawSnakeEnd:
        pop r6
        pop r5
        pop r4
        pop r3
        pop r2
        pop r1
        pop r0
        rts
