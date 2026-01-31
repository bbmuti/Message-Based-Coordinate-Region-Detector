`timescale 1ns / 1ps
module koordinat_belirleme(
    input [15:0] mesaj,
    output reg [1:0] bolge
    );
    
    wire [3:0] MSB1 =  mesaj [15:12];
    wire [3:0] MSB2 =  mesaj [11:8];
    wire [3:0] MSB3 =  mesaj [7:4];
    wire [3:0] MSB4 =  mesaj [3:0];
    
    wire [3:0] x_sonuc = MSB2 | MSB3;
    wire [3:0] y_sonuc = MSB1 | MSB4;
    
    always@(*)begin
        if(y_sonuc > 4'b0111)
            if(x_sonuc > 4'b0111)
                bolge = 2'b11; 
            else begin 
                bolge = 2'b00;
            end
   
        else begin
            if(x_sonuc > 4'b0111)
                bolge = 2'b10;
            else begin
                bolge = 2'b01;
            end
       end
   end        
endmodule
