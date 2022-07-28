/*  Circuitos Digitales 1
    I ciclo 2022  
Autor: Pablo Duran Segura */

//El presente programa describe un módulo COMP_4 que compara las magnitudes de 2 palabras de 4 bits cada una 

`include "COMPARATOR.v" 
`include "EXTENDER.v"

module  COMP_4( input X0,X1,X2,X3,Y0,Y1,Y2,Y3,   //entradas de la palabra X y Y
                 output k,l);                    //salidas

//cables que interconectan los modulos
wire K_COMPARATOR, L_COMPARATOR, K0_EXTENDER_1, L0_EXTENDER_1, K0_EXTENDER_2, L0_EXTENDER_2;

COMPARATOR Bloque_1(.A(X3), .B(Y3), .K(K_COMPARATOR), .L(L_COMPARATOR));//se comparan los MSB de ambas palabras
EXTENDER Bloque_2(.Ki(K_COMPARATOR), .Li(L_COMPARATOR), .A(X2), .B(Y2), .K0(K0_EXTENDER_1), .L0(L0_EXTENDER_1));//se compara el resultado del bloque anterior(2 bits) mas los segundos bits mas significativos de ambas palabras
EXTENDER Bloque_3(.Ki(K0_EXTENDER_1), .Li(L0_EXTENDER_1), .A(X1), .B(Y1), .K0(K0_EXTENDER_2), .L0(L0_EXTENDER_2));//se compara el resultado del bloque anterior(2 bits) mas los terceros bits mas significativos de ambas palabras
EXTENDER Bloque_4(.Ki(K0_EXTENDER_2), .Li(L0_EXTENDER_2), .A(X0), .B(Y0), .K0(k), .L0(l));//se compara el resultado del bloque anterior(2 bits) mas los LSB de ambas palabras


endmodule