/*  Circuitos Digitales 1
    I ciclo 2022  
Autor: Pablo Duran Segura */

//El presente programa describe un módulo COMPARATOR que compara las magnitudes de 2 bits por medio de dos multiplexores 

`include "MUX4x1_Case.v"    //se incluye el archivo del MUX4x1 para luego instanciarlo

module  COMPARATOR( input A,B,   //entradas, cada una de 1 bit
                 output K,L);  //salidas, cada una de 1 bit

reg [3:0]  I;

//instancio el modulo MUX para definir las entradas, lineas de seleccion y salidas diseñadas con los mapas de Karnaugh y las tablas de verdad
MUX4x1_Case MuxK (.I({1'b1,1'b0,1'b1,1'b1}), .S({A,B}), Y.(K));  //entradas I conectadas a Vcc o tierra, lineas de seleccion conectadas a las variables A y B, salidas K y L
MUX4x1_Case MuxL (.I({1'b1,1'b1,1'b0,1'b1}), .S({A,B}), Y.(L));  

endmodule   
