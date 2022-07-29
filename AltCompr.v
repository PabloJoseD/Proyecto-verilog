/*  Circuitos Digitales 1
    I ciclo 2022  
Autor: Pablo Duran Segura */

//El presente programa describe una maquina de estados que controla un sistema alternador de bombas

module AltCompr (input Clk, Reset,  //señal de reloj y reset
                input  PA, PB, PMB,  //entradas de la maquina(Sensores de presion)
                output C1,C2,C3);    //salidas de la maquina(compresores)


reg [3:0]  EstPres, ProxEstado; 

//asignacion de estados
parameter a = 4'b0001;
parameter b = 4'b0010;
parameter c = 4'b0011;
parameter d = 4'b0100;            
parameter e = 4'b0101;
parameter f = 4'b0110;
parameter g = 4'b0111;

//memoria de estados

always @(posedge Clk, posedge Reset)
    if (Reset)  EstPres <= a;
    else        EstPres <= ProxEstado;

//Logica de calculo de proximo estado

always @(*)
    case (EstPres)
    a   : case({PA,PB,PMB})
            3'b100 : ProxEstado = a;
            3'b010 : ProxEstado = c;
            3'b001 : ProxEstado = b;
          endcase
    b   : if (PA) ProxEstado = a;
            else  ProxEstado = b;
    c   : case({PMB,PA})
            2'b10 : ProxEstado = b;
            2'b00 : ProxEstado = c;
            2'b01 : ProxEstado = d;
          endcase
    d :  case({PA,PB,PMB})
            3'b100 : ProxEstado = d;
            3'b010 : ProxEstado = e;
            3'b000 : ProxEstado = d;
            3'b001 : ProxEstado = b;
         endcase
    e :  case({PMB,PA})
            2'b10 : ProxEstado = b;
            2'b00 : ProxEstado = e;
            2'b01 : ProxEstado = f;
         endcase
    f :  case({PA,PB,PMB})
            3'b100 : ProxEstado = f;
            3'b010 : ProxEstado = g;
            3'b000 : ProxEstado = f;
            3'b001 : ProxEstado = b;
         endcase
    e :  case({PMB,PA})
            2'b10 : ProxEstado = b;
            2'b00 : ProxEstado = g;
            2'b01 : ProxEstado = a;
         endcase
    endcase

//asignacion de los estados en donde se activan las salidas, el clk negado es cuando la salida C3 se activa en el IRE.
assign C1 = (EstPres == b | EstPres == c | EstPres == e | (EstPres == g&(~Clk)));
assign C2 = (EstPres == b | EstPres == c | EstPres == g | (EstPres == e&(~Clk)));
assign C3 = (EstPres == b | EstPres == e | EstPres == g | (EstPres == c&(~Clk)));

endmodule
