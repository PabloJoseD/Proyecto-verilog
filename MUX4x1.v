/*  Circuitos Digitales 1
    I ciclo 2022  
Pablo Duran Segura
**Este código es una adaptación de un programa brindado por Geovanny Delgado Cascante**/

// El presente programa describe un multiplexor 4x1 con sentencia Case 

module Mux4x1_Case  (  input[3:0] I,      //Entradas de datos 
                        input[1:0] S,     //Lineas de seleccion
                        output reg Y);    //Salida del multiplexor


always @ (*)    //Se evaluan todas las combinaciones de la entrada S
    case  (S)
        2'd0 : Y = I[0];   //Asigna la entrada 0 en Y si S=00
        2'd1 : Y = I[1];   //Asigna la entrada 1 en Y si S=01
        2'd2 : Y = I[2];   //Asigna la entrada 2 en Y si S=10
        2'd3 : Y = I[3];   //Asigna la entrada 3 en Y si S=11
    endcase

endmodule

