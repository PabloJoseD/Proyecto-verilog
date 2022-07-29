/*  Circuitos Digitales 1
    I ciclo 2022  
Autor: Pablo Duran Segura */

//El presente programa describe un módulo COMPARATOR que compara las magnitudes de 2 bits por medio de dos multiplexores 

`include "MUX4x1_Case.v"    //se incluye el archivo del MUX4x1 para luego instanciarlo

module  COMPARATOR( input A,B,   //entradas, cada una de 1 bit
                 output K,L);  //salidas, cada una de 1 bit
    
reg [3:0] I_K = 4'b1011;//valores en las entradas del mux para K
reg [3:0] I_L = 4'b1101;//valores en las entradas del mux para L



//instancio el modulo MUX para definir las entradas, lineas de seleccion y salidas diseñadas con los mapas de Karnaugh y las tablas de verdad
MUX4x1_Case MuxK (.I(I_K), .S({A, B}), .Y(K)); //multiplexor que resuelve K
MUX4x1_Case MuxL (.I(I_L), .S({A, B}), .Y(L));  //multiplexor que resuelve L
  

endmodule   
