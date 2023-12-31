// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


@8192
D=A
@n
M=D     //n=8192 (32x256)


(LOOP)
    //i=0
    @i
    M=0     

    //If no key pressed, draw white. Else black
    @KBD
    D=M
    @WHITE
    D;JEQ   
    @BLACK
    0;JMP


(WHITE)
    @i
    D=M
    @n
    D=D-M
    @LOOP
    D;JEQ   //if i==n, goto LOOP

    @SCREEN
    D=A
    @i
    A=D+M
    M=0    //RAM[SCREEN+i] = 0

    @i
    M=M+1   //i++

    @WHITE
    0;JMP   //goto WHITE

(BLACK)
    @i
    D=M
    @n
    D=D-M
    @LOOP
    D;JEQ   //if i==n, goto LOOP

    @SCREEN
    D=A
    @i
    A=D+M
    M=-1    //RAM[SCREEN+i] = -1

    @i
    M=M+1   //i++

    @BLACK
    0;JMP   //goto BLACK

