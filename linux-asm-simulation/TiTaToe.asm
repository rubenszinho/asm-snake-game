jmp main

; Constantes
starterMenuWelcome : string "Bem-vindo(a)"
starterMenuInstruction : string "Pressione Espaco para jogar"

winGameString : string "Ganhou o Jogo!!"
replayString : string "Pressione Espaco para jogar novamente"

xSymbol : string " X "
oSymbol : string " O "
xTurn : string "X Joga"
oTurn : string "O Joga"

map: string 
"                                      
               +         +             
               +         +             
               +         +             
          1    +    2    +    3        
               +         +             
               +         +             
      +++++++++++++++++++++++++++++    
               +         +             
               +         +             
               +         +             
          4    +    5    +    6        
               +         +             
               +         +             
               +         +             
      +++++++++++++++++++++++++++++    
               +         +             
               +         +             
          7    +    8    +    9        
               +         +             
               +         +             
               +         + 
"

SPACE : var #1 
static SPACE + #0, #32 
 
LAST_PIXEL : var #1 
static LAST_PIXEL + #0, #1199 

X_SYMBOL : var #1 
static X_SYMBOL + #0, #'X'
O_SYMBOL : var #1 
static O_SYMBOL + #0, #'O'

POSITION_ARRAY: var #9
static POSITION_ARRAY+ #0, #288
static POSITION_ARRAY+ #1, #298
static POSITION_ARRAY+ #2, #308
static POSITION_ARRAY+ #3, #568
static POSITION_ARRAY+ #4, #578
static POSITION_ARRAY+ #5, #588
static POSITION_ARRAY+ #6, #848
static POSITION_ARRAY+ #7, #858
static POSITION_ARRAY+ #8, #868

; Variaveis globais
counter : var #1 
static counter + #0, #0 

valueArray : var #9
static valueArray + #0, #0
static valueArray + #1, #0
static valueArray + #2, #0
static valueArray + #3, #0
static valueArray + #4, #0
static valueArray + #5, #0
static valueArray + #6, #0
static valueArray + #7, #0
static valueArray + #8, #0

marker : var #1
static marker + #0, #0

; Funcoes
; Funcoes de texto
printScreen:
	; r1 - string, r2 - endereco da tela, r3 - char

	printScreenLoop:
		loadn r0, #'\0'		
		loadi r3, r1
		cmp r3, r0 ; char sendo impresso
		jeq printScreenExit
		outchar r3, r2
		
		loadn r4, #1 ;incremento
		add r2, r2, r4
		add r1, r1, r4
		jmp printScreenLoop

	printScreenExit:
		rts

eraseScreen: 
	loadn r0, #0
	load r1, LAST_PIXEL
	load r2, SPACE
	loadn r3, #1 ;incremento
		
	eraseScreenLoop:
		outchar r2, r0
		add r0, r0, r3
		
		cmp r1, r0
		jne eraseScreenLoop
		
	rts	
		
; Funcoes de logica do jogo
InitiateGame:
	call eraseScreen
	
	loadn r1, #map
	loadn r2, #120
	call printScreen
	
	jmp initiateRound

initiateRound:	
	xTurn: 
		load r0, counter
		
		; Verifica empate
		loadn r1, #9
		cmp r0, r1
		jeq tieResult
		
		; Incrementa counter
		loadn r1, #1
		add r0, r0, r1
		store counter, r0
		
		; Declara vez de X
		loadn r1, #xTurn
		loadn r2, #1161
		call printScreen
		
		; Leitura da entrada
		readLoopX:
			; Devido a inchar nao ser bloqueante, o loop se torna necessario 
			loadn r1, #255	; inchar retorna #255 se nao ler nada
			inchar r0
			
			cmp r1, r0
			jeq readLoopX
		
		; Verificacao de entrada	
		loadn r1, #57 ; 9 (ASCII)
		cmp r1, r0 ; Input > 9
		jle readLoopX 
		
		loadn r1, #49 ; 1 (ASCII)
		cmp r0, r1 ; Input < 1
		jle readLoopX
		
		; Verifica se a posicao esta desocupada
		loadn r1, #49 ; Conversao para int (48) + Correcao de indice de vetor (1)
		loadn r2, #valueArray
		
		sub r0, r0, r1 ; Offset
		add r2, r2, r0 ; Index especificado pelo usuário
		loadi r3, r2 ; Obtencao do valor no index
		
		loadn r4, #0	
		cmp r3, r4 ; Verifica se a posicao esta desocupada
		jne readLoopX
		
		; Armazena X no array
		load r3, X_SYMBOL
		storei r2, r3
		
		; Atualiza mapa
		loadn r3, #POSITION_ARRAY
		add r3, r3, r0 ; Index da posicao do numero
		loadi r4, r3 ; Obtencao do valor no index
		
		loadn r1, #xSymbol
		mov r2, r4
		call printScreen
		
		load r0, X_SYMBOL
		store marker, r0
		call verifyLine1
		
	oTurn: 
		load r0, counter
		
		; Verifica empate
		loadn r1, #9
		cmp r0, r1
		jeq tieResult
		
		; Incrementa counter
		loadn r1, #1
		add r0, r0, r1
		store counter, r0
		
		; Declara vez de O
		loadn r1, #oTurn
		loadn r2, #1161
		call printScreen
		
		; Leitura da entrada
		readLoop:
			; Devido a inchar nao ser bloqueante, o loop se torna necessario 
			loadn r1, #255	; inchar retorna #255 se nao ler nada
			inchar r0
			
			cmp r1, r0
			jeq readLoop
			
		; Verificacao de entrada	
		loadn r1, #57 ; 9 (ASCII)
		cmp r1, r0 ; Input > 9
		jle readLoop 
		
		loadn r1, #49 ; 1 (ASCII)
		cmp r0, r1 ; Input < 1
		jle readLoop
		
		; Verifica se a posicao esta desocupada
		loadn r1, #49 ; Conversao para int (48) + Correcao de indice de vetor (1)
		loadn r2, #valueArray
		
		sub r0, r0, r1 ; Offset
		add r2, r2, r0 ; Index especificado pelo usuário
		loadi r3, r2 ; Obtencao do valor no index
		
		loadn r4, #0	
		cmp r3, r4 ; Verifica se a posicao esta desocupada
		jne readLoop
		
		; Armazena O no array
		load r3, O_SYMBOL
		storei r2, r3
		
		; Atualiza mapa
		loadn r3, #POSITION_ARRAY
		add r3, r3, r0 ; Index da posicao do numero
		loadi r4, r3 ; Obtencao do valor no index
		
		loadn r1, #oSymbol
		mov r2, r4
		call printScreen
		
		load r0, O_SYMBOL
		store marker, r0
		call verifyLine1
		
		jmp initiateRound
		
; Funcoes de Encerramento
verifyLine1:
	loadn r0, #valueArray
	loadn r1, #1
	load r7, marker
	
	loadi r2, r0
	cmp r2, r7
	jne verifyLine2
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyLine2
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyLine2
	
	jmp winGame
	
verifyLine2:
	loadn r0, #valueArray
	loadn r6, #3
	
	add r0, r0, r6
	
	loadi r2, r0
	cmp r2, r7
	jne verifyLine3
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyLine3
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyLine3
	
	jmp winGame
	
verifyLine3:
	loadn r0, #valueArray
	loadn r6, #6
	
	add r0, r0, r6
	
	loadi r2, r0
	cmp r2, r7
	jne verifyDiagonal1
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyDiagonal1
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyDiagonal1
	
	jmp winGame
	
verifyDiagonal1: 
	loadn r0, #valueArray
	loadn r1, #4
	
	loadi r2, r0
	cmp r2, r7
	jne verifyDiagonal2
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyDiagonal2
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyDiagonal2
	
	jmp winGame
	
verifyDiagonal2: 
	loadn r0, #valueArray
	loadn r1, #2
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn1
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn1
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn1

	jmp winGame
	
verifyColumn1:
	loadn r0, #valueArray
	loadn r1, #3
	
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn2
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn2
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn2
	
	jmp winGame
	
verifyColumn2:
	loadn r0, #valueArray
	loadn r1, #3
	loadn r3, #1
	
	add r0, r0, r3
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn3
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn3
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne verifyColumn3
	
	jmp winGame
	
verifyColumn3:
	loadn r0, #valueArray
	loadn r1, #3
	loadn r3, #2
	
	add r0, r0, r3
	loadi r2, r0
	cmp r2, r7
	jne failWin
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne failWin
	
	add r0, r0, r1
	loadi r2, r0
	cmp r2, r7
	jne failWin
	
	jmp winGame
	
failWin:
	rts

winGame:
 	call eraseScreen
 	
 	load r0, marker
 	load r3, X_SYMBOL
 	cmp r0, r3
 	jne oWon
 	
 	loadn r1, #xSymbol
 	loadn r2, #531
 	call printScreen
 	jmp winString
 	
 	oWon:
 		loadn r1, #oSymbol
 		loadn r2, #531
 		call printScreen
 		
 	winString:
	 	loadn r1, #winGameString
	 	loadn r2, #534
	 	call printScreen
	 	
	loadn r1, #replayString
	loadn r2, #642
	call printScreen
	
	readLoopReplay:
		load r2, SPACE
		inchar r0
		
		cmp r2, r0
		jne readLoopReplay
		
	; Reseta valueArray + counter
	
	
	loadn r0, #valueArray
	loadn r1, #0
	 
	storei r0, r1 ;[0]
	inc r0
	storei r0, r1 ;[1]
	inc r0
	storei r0, r1 ;[2]
	inc r0
	storei r0, r1 ;[3]
	inc r0
	storei r0, r1 ;[4]
	inc r0
	storei r0, r1 ;[5]
	inc r0
	storei r0, r1 ;[6]
	inc r0
	storei r0, r1 ;[7]
	inc r0
	storei r0, r1 ;[8]
	inc r0
	
	loadn r0, #counter
	storei r0, r1 
		
	call eraseScreen
	jmp main
 	
tieResult:
	call eraseScreen
	halt

; Main
main:
	; Mensagens de aprensentacao
	loadn r1, #starterMenuWelcome
	loadn r2, #41
	call printScreen
	
	loadn r1, #starterMenuInstruction
	loadn r2, #201
	call printScreen
	
	; Leitura de entrada
	load r2, SPACE 	
	inchar r1 		
	cmp r1, r2
	jeq InitiateGame
	jmp main