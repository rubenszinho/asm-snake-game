mensagem_inicial: string "Bem vindo ao Pedra, Papel ou Tesoura!"
erase_msn_inicial: string "                                     "

mensagem_escolha1: string "Para jogar, escolha"
erase_msn_escolha1: string "                   "

mensagem_escolha2: string "[1] Pedra  [2] Papel  [3] Tesoura"
erase_msn_escolha2: string "                                 "

mensagem_perdeu: string "Te venci! Garanto que ganho de novo!"
erase_msn_perdeu: string "                                    "

mensagem_ganhou: string "Que coisa! Parabens! Que tal mais uma?" 
erase_msn_ganhou: string "                                      " 

mensagem_empate: string "Empate! Que doideira!! Vamos de novo?"
erase_msn_empate: string "                                     "

mensagem_restart: string "Pressione 'space' para jogar de novo!"
erase_msn_restart: string "                                     "

mensagem_eraseAll: string "|-----PEDRA-----PAPEL------TESOURA-----||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||--------------------------------------|"

;pedraUS: string "|--------------------------------------||                   |                  ||                   |                  ||                   |                  || pedra             |                  || -----             |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||     ______        |                  || ---'  ___ )       |                  ||      (___)        |                  ||      (___)        |                  ||      (__)         |                  ||---.__(_)          |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                                      ||                                      ||                                      ||                                      ||--------------------------------------|"
;papelUS: string "|--------------------------------------||                   |                  ||                   |                  ||                   |                  || papel             |                  || -----             |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||     ____          |                  || ---'  __)____     |                  ||         _____)    |                  ||          _____)   |                  ||          ____)    |                  || ---._______)      |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                                      ||                                      ||                                      ||                                      ||--------------------------------------|"
;tesouraUS: string "|--------------------------------------||                   |                  ||                   |                  ||                   |                  || tesoura           |                  || -------           |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||     ____          |                  || ---'   __)__      |                  ||         ____)     |                  ||        ______)    |                  ||       (__)        |                  || ---._(__)         |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                   |                  ||                                      ||                                      ||                                      ||                                      ||--------------------------------------|"

;pedraMA: string "|--------------------------------------||                    |                 ||                    |                 ||                    |                 ||                    |           pedra ||                    |           ----- ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |       ______    ||                    |      (___   '-- ||                    |      (___)      ||                    |      (___)      ||                    |       (__)      ||                    |        (_)__.-- ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                                      ||                                      ||                                      ||                                      ||--------------------------------------|"
;papelMA: string "|--------------------------------------||                    |                 ||                    |                 ||                    |                 ||                    |           papel ||                    |           ----- ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |        ____     ||                    |   ____(___  '---||                    |  (_____         ||                    | (_____          ||                    |  (____          ||                    |     (_______.---||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                                      ||                                      ||                                      ||                                      ||--------------------------------------|"
;tesouraMA: string "|--------------------------------------||                    |                 ||                    |                 ||                    |                 ||                    |         tesoura ||                    |         ------- ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |         ____    ||                    |      __(__  '-- ||                    |     (__         ||                    |     (______     ||                    |        (__)     ||                    |        (__)_.-- ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                    |                 ||                                      ||                                      ||                                      ||                                      ||--------------------------------------|"

tela0: string "|-----PEDRA-----PAPEL------TESOURA-----||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                                      ||                    _                 ||                   ) )                ||                  /=/___              ||              ---'  (___)             ||                   (___)              ||                   (__)               ||             ---.__(_)                ||                                      |"

; 1-pedra, 2-papel, 3-tesoura
selecao_usuraio: var #1 
selecao_maquina: var #1

resultado_final: var #1 ; 1-usuário perdeu, 2-usuário perdeu, 3- empate

IncRand: var #1 ; Incremento para circular na Tabela de nr. Randomicos

rand: var #3 
    static rand + #0, #1 ; pedra
    static rand + #1, #2 ; papel
    static rand + #2, #3 ; tesoura


Main:
    loop_main:    
        call Limpa_Tela
        call Inicializa
        call Jogo
    jmp loop_main
    
Inicializa: 

    push r0 
    push r1
    push r2     
    
    loadn r0, #0 ;posição da mensagem na tela
    loadn r1, #tela0
    loadn r2, #512 ;verde
    call Imprime

    loadn r0, #362 ;posição da mensagem na tela
    loadn r1, #mensagem_inicial
    loadn r2, #512 ;verde 
    call Imprime
    
    loadn r0, #530 ;posição da mensagem na tela
    loadn r1, #mensagem_escolha1
    loadn r2, #0 ;branco 
    call Imprime
    
    call Escolhe_numero
    
    pop r2
    pop r1
    pop r0
    
    rts
    
Escolhe_numero:
    push r0 
    push r1 ; pedra
    push r2 ; papel
    push r3 ; tesoura
    push r4 ; IncRand
    
    loadn r0, #603 ;posição da mensagem na tela
    loadn r1, #mensagem_escolha2
    loadn r2, #3584 ;aqua
    call Imprime
    
    loadn r1, #'1'
    loadn r2, #'2'
    loadn r3, #'3'   
    
    loop_escolha:
        inchar r0 ; espera resposta
        
        inc r4 ; IncRand++ 
        
        ; verifica se houve uma seleção válida
        cmp r0, r1
        jeq sel_pedra
        
        cmp r0, r2
        jeq sel_papel
        
        cmp r0, r3
        jeq sel_tesoura  
        
        jmp loop_escolha
    
        sel_pedra:
            loadn r0, #1
            store selecao_usuraio, r0
            jmp end_escolheNum
            
        sel_papel:
            loadn r0, #2
            jmp end_escolheNum
            
        sel_tesoura:
            loadn r0, #3
            store selecao_usuraio, r0
            jmp end_escolheNum
          

    end_escolheNum:
        
        loadn r3, #3  
        mod r4, r4, r3
        
        store IncRand, r4
        call Escolha_da_maquina
    
        pop r4
        pop r3
        pop r2 
        pop r1
        pop r0
    
    rts

Escolha_da_maquina:
    push r0
    push r1 ; indice do número rand a ser pego
    push r2 ; declara ponteiro para tabela rand
    push r3 ; recebe número aleatório
    
    loadn r0, #3
    load r1, IncRand
    
    loadn r2, #rand
    
    add r2, r2, r1 ; soma incremento ao início da tabela rand
    
    loadi r3, r2 ; R3 = rand(IncRand)   

    store selecao_maquina, r3
    
    pop r3
    pop r2
    pop r1
    pop r0
    rts
    
Jogo: 
    push r0 ; usuário
    push r1 ; máquina
    push r2 
    push r3 ; resultado do jogo
    push r4
    
    ; apaga todas as mensagens que podem estar na tela
    loadn r0, #362 ;posição da mensagem na tela
    loadn r1, #erase_msn_inicial
    loadn r2, #2816 ;amarelo 
    call Imprime
    
    loadn r0, #530 ;posição da mensagem na tela
    loadn r1, #erase_msn_escolha1
    loadn r2, #0 ;branco 
    call Imprime
    
    loadn r0, #603 ;posição da mensagem na tela
    loadn r1, #erase_msn_escolha2
    loadn r2, #1536 ;teal
    call Imprime
    
    ; carrega as escolhas dos jogadores
    load r0, selecao_usuraio
    load r1, selecao_maquina
    
    ;1-usuário perdeu, 2-usuário perdeu, 3- empate
    cmp r0, r1
    jne quem_ganhou ; se não for empate, vê quem ganhou
    
    ; se for igual, deu empate
    loadn r3, #3 
    store resultado_final, r3
    jmp end_jogo
    
    ; r0 -> usuário
    ; r1 -> máquina
    quem_ganhou:
    
        loadn r2, #1 ; pedra
        loadn r3, #2 ; papel
        loadn r4, #3 ; tesoura

        cmp r0, r2 ;usuário -> pedra
        jeq check_r0_1
            
        cmp r0, r3 ;usuário -> papel
        jeq check_r0_2
            
        cmp r0, r4 ;usuário -> tesoura
        jeq check_r0_3
            
        jmp end_jogo

        check_r0_1:       ; r0 = 1 (pedra)
            cmp r1, r3    ; r1 = 2 (papel)
            jeq usuario_perdeu
            cmp r1, r4    ; r1 = 3 (tesoura)
            jeq usuario_ganhou
            jmp end_jogo

        check_r0_2:       ; r0 = 2 (papel)
            cmp r1, r2    ; r1 = 1 (pedra)
            jeq usuario_ganhou
            cmp r1, r4    ; r1 = 3 (tesoura)
            jeq usuario_perdeu
            jmp end_jogo

        check_r0_3:       ; r0 = 3 (tesoura)
            cmp r1, r2    ; r1 = 1 (pedra)
            jeq usuario_perdeu
            cmp r1, r3    ; r1 = 2 (papel)
            jeq usuario_ganhou
            jmp end_jogo

        usuario_ganhou:
            loadn r3, #2  ; usuário ganhou
            store resultado_final, r3
            jmp end_jogo

        usuario_perdeu:
            loadn r3, #1  ; usuário perdeu
            store resultado_final, r3
            jmp end_jogo
        
    end_jogo:
    
    call Resultado
    
    pop r4
    pop r3
    pop r2
    pop r1 
    pop r0
    rts

Resultado:
    
    push r0 ; pedra [1]
    push r1 ; papel [2]
    push r2 ; tesoura [3]
    push r3 ; seleção usuário
    push r4 ; seleção máquina
    push r5 ; resultado do jogo
    push r6
    
    call Limpa_Tela
    
    loadn r0, #1 ; pedra / usuário perdeu
    loadn r1, #2 ; papel / usuário ganhou
    loadn r2, #3 ; tesoura / empate
    
    ; 1-pedra, 2-papel, 3-tesoura
    load r3, selecao_usuraio
    load r4, selecao_maquina
    
    ; 1-usuário perdeu, 2-usuário perdeu, 3- empate
    load r5, resultado_final 
    
    cmp r3, r0 
    jeq imprime_us_pedra
    
    cmp r3, r1
    jeq imprime_us_papel
    
    cmp r3, r2
    jeq imprime_us_tesoura
    
    jmp imprime_MA
    
    imprime_US: ; imprime resultado do usuário 
        imprime_us_pedra:
            loadn r1, #pedraUSLinha00
            loadn r2, #2816 ;amarelo
            loadn r6, #pedraUSLinha00
            call ImprimeTela2
            jmp imprime_MA
            
        imprime_us_papel:
            loadn r1, #papelUSLinha00
            loadn r2, #2816 ;amarelo
            loadn r6, #papelUSLinha00
            call ImprimeTela2
            jmp imprime_MA
        
        imprime_us_tesoura:
            loadn r1, #tesouraUSLinha00
            loadn r2, #2816 ;amarelo
            loadn r6, #tesouraUSLinha00
            call ImprimeTela2
            jmp imprime_MA
    
    imprime_MA: ; imprime resultado da máquina
        ; garante os valores nos registrores 
        loadn r0, #1 ; pedra / usuário perdeu
        loadn r1, #2 ; papel / usuário ganhou
        loadn r2, #3 ; tesoura / empate
        
        cmp r4, r0 
        jeq imprime_ma_pedra
        
        cmp r4, r1
        jeq imprime_ma_papel
        
        cmp r4, r2
        jeq imprime_ma_tesoura
        
        jmp imprime_mensagem_resultado
        
        imprime_ma_pedra:
            loadn r1, #pedraMALinha00
            loadn r2, #2304 ;vermelho
            loadn r6, #pedraMALinha00
            call ImprimeTela2
            jmp imprime_mensagem_resultado
            
        imprime_ma_papel:
            loadn r1, #papelMALinha00
            loadn r2, #2304 ;vermelho
            loadn r6, #papelMALinha00
            call ImprimeTela2
            jmp imprime_mensagem_resultado
            
        imprime_ma_tesoura:
            loadn r1, #tesouraMALinha00
            loadn r2, #2304 ;vermelho
            loadn r6, #tesouraMALinha00
            call ImprimeTela2
            jmp imprime_mensagem_resultado
    
    imprime_mensagem_resultado: ; imprime mensagem de acordo com o resultado final do jogo
        ; garante os valores nos registrores 
        loadn r0, #1 ; usuário perdeu
        loadn r1, #2 ; usuário ganhou
        loadn r2, #3 ; empate
        
        cmp r5, r0
        jeq imprime_mensagem_perdeu
        
        cmp r5, r1
        jeq imprime_mensagem_ganhou
        
        cmp r5, r2
        jeq imprime_mensagem_empate
        
        jmp end_resultado
        
        imprime_mensagem_perdeu:
            loadn r0, #1042 ;posição da mensagem na tela
            loadn r1, #mensagem_perdeu
            loadn r2, #2304 ; vermelho
            call Imprime
            jmp end_resultado
            
        imprime_mensagem_ganhou:
            loadn r0, #1041 ;posição da mensagem na tela
            loadn r1, #mensagem_ganhou
            loadn r2, #2816 ; amarelo
            call Imprime
            jmp end_resultado
            
        imprime_mensagem_empate: 
            loadn r0, #1042 ;posição da mensagem na tela
            loadn r1, #mensagem_empate
            loadn r2, #0 ; branco
            call Imprime
            jmp end_resultado
            
    end_resultado:
    
    call Restart
    
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    
    rts
    
Restart:
    push r0
    push r1 
    push r2
    push r3
    push r4
    
    loadn r0, #1122 ;posição da mensagem na tela
    loadn r1, #mensagem_restart
    loadn r2, #0
    call Imprime
    
    loop_restart:
        inchar r3
        loadn r4, #' '
        cmp r3, r4
        jeq quer_restart
        jmp loop_restart

    quer_restart:
        
        pop r4 
        pop r3
        pop r2
        pop r1
        pop r0
    
        jmp loop_main   
    
    rts 

Imprime:
    push r0     ; Posição na tela para imprimir a string
    push r1     ; Endereço da string a ser impressa
    push r2     ; Cor da mensagem
    push r3
    push r4
    
    loadn r3, #'\0'

    LoopImprime:    
        loadi r4, r1
        cmp r4, r3
        jeq SaiImprime
        add r4, r2, r4
        outchar r4, r0
        inc r0
        inc r1
        jmp LoopImprime
        
    SaiImprime: 
        pop r4  
        pop r3
        pop r2
        pop r1
        pop r0
        
    rts

Limpa_Tela:
    
    push r0
    push r1
    push r2
    
    loadn r0, #0
    loadn r1, #mensagem_eraseAll
    loadn r2, #0 ; branco
    call Imprime
    
    pop r2
    pop r1
    pop r0
    rts

;********************************************************
;                       IMPRIME TELA2
;********************************************************   

ImprimeTela2:   ;  Rotina de Impresao de Cenario na Tela Inteira
        ;  r1 = endereco onde comeca a primeira linha do Cenario
        ;  r2 = cor do Cenario para ser impresso

    push r0 ; protege o r3 na pilha para ser usado na subrotina
    push r1 ; protege o r1 na pilha para preservar seu valor
    push r2 ; protege o r1 na pilha para preservar seu valor
    push r3 ; protege o r3 na pilha para ser usado na subrotina
    push r4 ; protege o r4 na pilha para ser usado na subrotina
    push r5 ; protege o r5 na pilha para ser usado na subrotina
    push r6 ; protege o r6 na pilha para ser usado na subrotina

    loadn R0, #0    ; posicao inicial tem que ser o comeco da tela!
    loadn R3, #40   ; Incremento da posicao da tela!
    loadn R4, #41   ; incremento do ponteiro das linhas da tela
    loadn R5, #1200 ; Limite da tela!
    ;loadn R6, #tela1Linha0  ; Endereco onde comeca a primeira linha do cenario!!
    
   ImprimeTela2_Loop:
        call ImprimeStr2
        add r0, r0, r3      ; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
        add r1, r1, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
        add r6, r6, r4      ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
        cmp r0, r5          ; Compara r0 com 1200
        jne ImprimeTela2_Loop   ; Enquanto r0 < 1200

    pop r6  ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts
                
;---------------------

;---------------------------    
;********************************************************
;                   IMPRIME STRING2
;********************************************************
    
ImprimeStr2:    ;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
    push r0 ; protege o r0 na pilha para preservar seu valor
    push r1 ; protege o r1 na pilha para preservar seu valor
    push r2 ; protege o r1 na pilha para preservar seu valor
    push r3 ; protege o r3 na pilha para ser usado na subrotina
    push r4 ; protege o r4 na pilha para ser usado na subrotina
    push r5 ; protege o r5 na pilha para ser usado na subrotina
    push r6 ; protege o r6 na pilha para ser usado na subrotina
    
    loadn r3, #'\0' ; Criterio de parada
    loadn r5, #' '  ; Espaco em Branco

   ImprimeStr2_Loop:    
        loadi r4, r1
        cmp r4, r3      ; If (Char == \0)  vai Embora
        jeq ImprimeStr2_Sai
        cmp r4, r5      ; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
        jeq ImprimeStr2_Skip
        add r4, r2, r4  ; Soma a Cor
        outchar r4, r0  ; Imprime o caractere na tela
        storei r6, r4
   ImprimeStr2_Skip:
        inc r0          ; Incrementa a posicao na tela
        inc r1          ; Incrementa o ponteiro da String
        inc r6          ; Incrementa o ponteiro da String da Tela 0
        jmp ImprimeStr2_Loop
    
   ImprimeStr2_Sai: 
    pop r6  ; Resgata os valores dos registradores utilizados na Subrotina da Pilha
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

; tela papel - usuário 
papelUSLinha00: string "|--------------------------------------|"
papelUSLinha01: string "|                   |                  |"
papelUSLinha02: string "|                   |                  |"
papelUSLinha03: string "|                   |                  |"
papelUSLinha04: string "| papel             |                  |"
papelUSLinha05: string "| -----             |                  |"
papelUSLinha06: string "|                   |                  |"
papelUSLinha07: string "|                   |                  |"
papelUSLinha08: string "|                   |                  |"
papelUSLinha09: string "|                   |                  |"
papelUSLinha10: string "|     ____          |                  |"
papelUSLinha11: string "| ---'  __)____     |                  |"
papelUSLinha12: string "|         _____)    |                  |"
papelUSLinha13: string "|          _____)   |                  |"
papelUSLinha14: string "|          ____)    |                  |"
papelUSLinha15: string "| ---._______)      |                  |"
papelUSLinha16: string "|                   |                  |"
papelUSLinha17: string "|                   |                  |"
papelUSLinha18: string "|                   |                  |"
papelUSLinha19: string "|                   |                  |"
papelUSLinha20: string "|                   |                  |"
papelUSLinha21: string "|                   |                  |"
papelUSLinha22: string "|                   |                  |"
papelUSLinha23: string "|                   |                  |"
papelUSLinha24: string "|                   |                  |"
papelUSLinha25: string "|                                      |"
papelUSLinha26: string "|                                      |"
papelUSLinha27: string "|                                      |"
papelUSLinha28: string "|                                      |"
papelUSLinha29: string "|--------------------------------------|"

; tela pedra - usuário 
pedraUSLinha00: string "|--------------------------------------|"
pedraUSLinha01: string "|                   |                  |"
pedraUSLinha02: string "|                   |                  |"
pedraUSLinha03: string "|                   |                  |"
pedraUSLinha04: string "| pedra             |                  |"
pedraUSLinha05: string "| -----             |                  |"
pedraUSLinha06: string "|                   |                  |"
pedraUSLinha07: string "|                   |                  |"
pedraUSLinha08: string "|                   |                  |"
pedraUSLinha09: string "|                   |                  |"
pedraUSLinha10: string "|     ______        |                  |"
pedraUSLinha11: string "| ---'  ___ )       |                  |"
pedraUSLinha12: string "|      (___)        |                  |"
pedraUSLinha13: string "|      (___)        |                  |"
pedraUSLinha14: string "|      (__)         |                  |"
pedraUSLinha15: string "|---.__(_)          |                  |"
pedraUSLinha16: string "|                   |                  |"
pedraUSLinha17: string "|                   |                  |"
pedraUSLinha18: string "|                   |                  |"
pedraUSLinha19: string "|                   |                  |"
pedraUSLinha20: string "|                   |                  |"
pedraUSLinha21: string "|                   |                  |"
pedraUSLinha22: string "|                   |                  |"
pedraUSLinha23: string "|                   |                  |"
pedraUSLinha24: string "|                   |                  |"
pedraUSLinha25: string "|                                      |"
pedraUSLinha26: string "|                                      |"
pedraUSLinha27: string "|                                      |"
pedraUSLinha28: string "|                                      |"
pedraUSLinha29: string "|--------------------------------------|"

; tela tesoura - usuário
tesouraUSLinha00: string "|--------------------------------------|"
tesouraUSLinha01: string "|                   |                  |"
tesouraUSLinha02: string "|                   |                  |"
tesouraUSLinha03: string "|                   |                  |"
tesouraUSLinha04: string "| tesoura           |                  |"
tesouraUSLinha05: string "| -------           |                  |"
tesouraUSLinha06: string "|                   |                  |"
tesouraUSLinha07: string "|                   |                  |"
tesouraUSLinha08: string "|                   |                  |"
tesouraUSLinha09: string "|                   |                  |"
tesouraUSLinha10: string "|     ____          |                  |"
tesouraUSLinha11: string "| ---'   __)__      |                  |"
tesouraUSLinha12: string "|         ____)     |                  |"
tesouraUSLinha13: string "|        ______)    |                  |"
tesouraUSLinha14: string "|       (__)        |                  |"
tesouraUSLinha15: string "| ---._(__)         |                  |"
tesouraUSLinha16: string "|                   |                  |"
tesouraUSLinha17: string "|                   |                  |"
tesouraUSLinha18: string "|                   |                  |"
tesouraUSLinha19: string "|                   |                  |"
tesouraUSLinha20: string "|                   |                  |"
tesouraUSLinha21: string "|                   |                  |"
tesouraUSLinha22: string "|                   |                  |"
tesouraUSLinha23: string "|                   |                  |"
tesouraUSLinha24: string "|                   |                  |"
tesouraUSLinha25: string "|                                      |"
tesouraUSLinha26: string "|                                      |"
tesouraUSLinha27: string "|                                      |"
tesouraUSLinha28: string "|                                      |"
tesouraUSLinha29: string "|--------------------------------------|"

papelMALinha00: string "|--------------------------------------|"
papelMALinha01: string "|                    |                 |"
papelMALinha02: string "|                    |                 |"
papelMALinha03: string "|                    |                 |"
papelMALinha04: string "|                    |           papel |"
papelMALinha05: string "|                    |           ----- |"
papelMALinha06: string "|                    |                 |"
papelMALinha07: string "|                    |                 |"
papelMALinha08: string "|                    |                 |"
papelMALinha09: string "|                    |                 |"
papelMALinha10: string "|                    |        ____     |"
papelMALinha11: string "|                    |   ____(___  '---|"
papelMALinha12: string "|                    |  (_____         |"
papelMALinha13: string "|                    | (_____          |"
papelMALinha14: string "|                    |  (____          |"
papelMALinha15: string "|                    |     (_______.---|"
papelMALinha16: string "|                    |                 |"
papelMALinha17: string "|                    |                 |"
papelMALinha18: string "|                    |                 |"
papelMALinha19: string "|                    |                 |"
papelMALinha20: string "|                    |                 |"
papelMALinha21: string "|                    |                 |"
papelMALinha22: string "|                    |                 |"
papelMALinha23: string "|                    |                 |"
papelMALinha24: string "|                    |                 |"
papelMALinha25: string "|                                      |"
papelMALinha26: string "|                                      |"
papelMALinha27: string "|                                      |"
papelMALinha28: string "|                                      |"
papelMALinha29: string "|--------------------------------------|"



pedraMALinha00: string "|--------------------------------------|"
pedraMALinha01: string "|                    |                 |"
pedraMALinha02: string "|                    |                 |"
pedraMALinha03: string "|                    |                 |"
pedraMALinha04: string "|                    |           pedra |"
pedraMALinha05: string "|                    |           ----- |"
pedraMALinha06: string "|                    |                 |"
pedraMALinha07: string "|                    |                 |"
pedraMALinha08: string "|                    |                 |"
pedraMALinha09: string "|                    |                 |"
pedraMALinha10: string "|                    |       ______    |"
pedraMALinha11: string "|                    |      (___   '-- |"
pedraMALinha12: string "|                    |      (___)      |"
pedraMALinha13: string "|                    |      (___)      |"
pedraMALinha14: string "|                    |       (__)      |"
pedraMALinha15: string "|                    |        (_)__.-- |"
pedraMALinha16: string "|                    |                 |"
pedraMALinha17: string "|                    |                 |"
pedraMALinha18: string "|                    |                 |"
pedraMALinha19: string "|                    |                 |"
pedraMALinha20: string "|                    |                 |"
pedraMALinha21: string "|                    |                 |"
pedraMALinha22: string "|                    |                 |"
pedraMALinha23: string "|                    |                 |"
pedraMALinha24: string "|                    |                 |"
pedraMALinha25: string "|                                      |"
pedraMALinha26: string "|                                      |"
pedraMALinha27: string "|                                      |"
pedraMALinha28: string "|                                      |"
pedraMALinha29: string "|--------------------------------------|"


tesouraMALinha00: string "|--------------------------------------|"
tesouraMALinha01: string "|                    |                 |"
tesouraMALinha02: string "|                    |                 |"
tesouraMALinha03: string "|                    |                 |"
tesouraMALinha04: string "|                    |         tesoura |"
tesouraMALinha05: string "|                    |         ------- |"
tesouraMALinha06: string "|                    |                 |"
tesouraMALinha07: string "|                    |                 |"
tesouraMALinha08: string "|                    |                 |"
tesouraMALinha09: string "|                    |                 |"
tesouraMALinha10: string "|                    |         ____    |"
tesouraMALinha11: string "|                    |      __(__  '-- |"
tesouraMALinha12: string "|                    |     (__         |"
tesouraMALinha13: string "|                    |    (_______     |"
tesouraMALinha14: string "|                    |        (__)     |"
tesouraMALinha15: string "|                    |        (__)_.-- |"
tesouraMALinha16: string "|                    |                 |"
tesouraMALinha17: string "|                    |                 |"
tesouraMALinha18: string "|                    |                 |"
tesouraMALinha19: string "|                    |                 |"
tesouraMALinha20: string "|                    |                 |"
tesouraMALinha21: string "|                    |                 |"
tesouraMALinha22: string "|                    |                 |"
tesouraMALinha23: string "|                    |                 |"
tesouraMALinha24: string "|                    |                 |"
tesouraMALinha25: string "|                                      |"
tesouraMALinha26: string "|                                      |"
tesouraMALinha27: string "|                                      |"
tesouraMALinha28: string "|                                      |"
tesouraMALinha29: string "|--------------------------------------|"


; tela inicial
mapa0Linha00: string "|--------------------------------------|"
mapa0Linha01: string "|                                      |"
mapa0Linha02: string "|                                      |"
mapa0Linha03: string "|                                      |"
mapa0Linha04: string "|                                      |"
mapa0Linha05: string "|                                      |"
mapa0Linha06: string "|                                      |"
mapa0Linha07: string "|                                      |"
mapa0Linha08: string "|                                      |"
mapa0Linha09: string "|                                      |"
mapa0Linha10: string "|                                      |"
mapa0Linha11: string "|                                      |"
mapa0Linha12: string "|                                      |"
mapa0Linha13: string "|                                      |"
mapa0Linha14: string "|                                      |"
mapa0Linha15: string "|                                      |"
mapa0Linha16: string "|                                      |"
mapa0Linha17: string "|                                      |"
mapa0Linha18: string "|                                      |"
mapa0Linha19: string "|                                      |"
mapa0Linha20: string "|                    _                 |"
mapa0Linha21: string "|                   ) )                |"
mapa0Linha22: string "|                  /=/___              |"
mapa0Linha23: string "|              ---'  (___)             |"
mapa0Linha24: string "|                   (___)              |"
mapa0Linha27: string "|                   (__)               |"
mapa0Linha28: string "|             ---.__(_)                |"
mapa0Linha29: string "|                                      |"
