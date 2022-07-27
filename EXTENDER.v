/*  Circuitos Digitales 1
    I ciclo 2022  
Autor: Pablo Duran Segura */

//El presente programa describe un módulo EXTENDER que compara las magnitudes de 2 palabras de dos bits

module EXTENDER (input Ki,Li,A,B,         //entradas 
                    output  reg K0,L0);   //salidas
                

//funciones que definen cuando se activan o se desactivan las salidas

    always @(*) begin


        if (~Li | Ki&A | Ki&~B) begin   //cuando se de alguna de estas combinaciones se activa la salida K0, de otra forma no se activa
            K0 = 1;
        end

        else 
            K0 = 0;

        if (~Ki | Li&B | ~A&Li) begin  //cuando se de alguna de estas combinaciones se activa la salida L0, de otra forma no se activa
            L0 = 1;
         end 

        else 
          L0 = 0;

        end 

endmodule
