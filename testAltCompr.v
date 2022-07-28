/*  Circuitos Digitales 1
    I ciclo 2022  
Autor: Pablo Duran Segura */

//El presente programa comprueba el modulo AltCompr
//Orden de presedencia de las entradas para los test vectors PA-PB-PMB

//escala de tiempo a utilizar
`timescale 1ns/1ns 

module testAltCompr;

    reg Clk , Reset;  //entradas
    reg PA, PB, PMB;

    wire C1, C2, C3;  //salidas

//datatypes para almacenar los vectores de prueba
   
    reg [3:0] testvectors [33:0];
    integer vectornum;

    //se instancia el modulo que se esta probando
    AltCompr uut (
        .Clk(Clk) , .Reset(Reset) ,
        .PA(PA) , .PB(PB) , .PMB(PMB) , 
        .C1(C1) , .C2(C2) , .C3(C3) 
        );
//vectores de prueba
    initial 
        begin


            testvectors[0] = 4'b100;   //PA=1, PB= 0, PMB=0 (se mantiene en estado a)
            testvectors[1] = 4'b001;   //PA=0, PB= 0, PMB=1 (pasa al estado b, C1C2C3 activo)
            testvectors[2] = 4'b100;   //PA=1, PB= 0, PMB=0 (regresa al estado a)
            testvectors[3] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado c, C1C2 activo)
            testvectors[4] = 4'b001;   //PA=0, PB= 0, PMB=1 (pasa al estado b, C1C2C3 activo)
            testvectors[5] = 4'b100;   //PA=1, PB= 0, PMB=0 (regresa al estado a)
            testvectors[6] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado c, C1C2 activo)
            testvectors[7] = 4'b100;   //PA=1, PB= 0, PMB=0 (pasa al estado d)
            testvectors[8] = 4'b001;   //PA=0, PB= 0, PMB=1 (pasa al estado b, C1C2C3 activo)
            testvectors[9] = 4'b100;   //PA=1, PB= 0, PMB=0 (regresa al estado a)
            testvectors[10] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado c, C1C2 activo)
            testvectors[11] = 4'b100;   //PA=1, PB= 0, PMB=0 (pasa al estado d)
            testvectors[12] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado e, C1C3 activo)
            testvectors[13] = 4'b001;   //PA=0, PB= 0, PMB=1 (pasa al estado b, C1C2C3 activo)
            testvectors[14] = 4'b100;   //PA=1, PB= 0, PMB=0 (regresa al estado a)
            testvectors[15] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado c, C1C2 activo)
            testvectors[16] = 4'b100;   //PA=1, PB= 0, PMB=0 (pasa al estado d)
            testvectors[17] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado e, C1C3 activo)
            testvectors[18] = 4'b100;   //PA=1, PB= 0, PMB=0 (pasa al estado f)
            testvectors[19] = 4'b001;   //PA=0, PB= 0, PMB=1 (pasa al estado b, C1C2C3 activo)
            testvectors[20] = 4'b100;   //PA=1, PB= 0, PMB=0 (regresa al estado a)
            testvectors[21] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado c, C1C2 activo)
            testvectors[22] = 4'b100;   //PA=1, PB= 0, PMB=0 (pasa al estado d)
            testvectors[23] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado e, C1C3 activo)
            testvectors[24] = 4'b101;   //PA=1, PB= 0, PMB=1 (pasa al estado f)
            testvectors[25] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado g, C2C3 activo)
            testvectors[26] = 4'b001;   //PA=0, PB= 0, PMB=1 (pasa al estado b, C1C2C3 activo)
            testvectors[27] = 4'b100;   //PA=1, PB= 0, PMB=0 (regresa al estado a)
            testvectors[28] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado c, C1C2 activo)
            testvectors[29] = 4'b100;   //PA=1, PB= 0, PMB=0 (pasa al estado d)
            testvectors[30] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado e, C1C3 activo)
            testvectors[31] = 4'b100;   //PA=1, PB= 0, PMB=0 (pasa al estado f)
            testvectors[32] = 4'b010;   //PA=0, PB= 1, PMB=0 (pasa al estado g, C2C3 activo)
            testvectors[33] = 4'b100;   //PA=1, PB= 0, PMB=0 (regresa al estado a)

            vectornum = 0; //se inician los vectores de prueba

            Reset = 1;  //para que los flip flops arranquen reseteados
            #3 Reset = 0;
            
//archivos para la forma de onda en gtkwave
            $dumpfile ("AltCompr.vcd");
            $dumpvars(0,testAltCompr) ;//Se exportan todas las variables

        end
//se crea la señal de reloj
always 
    begin
        Clk = 1; #5; Clk = 0; #5;
    end
    
//se leen las entradas en el flanco inactivo de la señal de reloj
always @ ( negedge Clk ) 
    begin
    {PA,PB,PMB} = testvectors[vectornum];
        $display("Las entradas son PA=%b, PB=%b, PMP=%b", PA, PB, PMB); //muestre el valor de las entradas en la terminal
    end

//cambio de estado en el ciclo activo de la señal de reloj, se activan las salidas de moore.     
    always @( posedge Clk )
    #1 if (!Reset)
        begin

            $display("La salida C1 es %b, la salida C1 es %b y la salida C3 es  %b", C1, C2, C3); //muestre el valor de las salidas en la terminal
            vectornum = vectornum + 1;
                if (vectornum == 34) 
                    $finish ; //condicion de parada
        end
endmodule
