`timescale 1ns / 1ps
module tb_koordinat_belirleme();
    reg [15:0] tb_mesaj;
    wire [1:0] tb_bolge;
    
    koordinat_belirleme uut(
        .mesaj(tb_mesaj),
        .bolge(tb_bolge) );
         
    initial begin
    
        tb_mesaj = 16'b1111000000001111;
        #10;
        tb_mesaj = 16'b1111000000000000;
        #10;
        tb_mesaj = 16'b0000000000000000;
        #10;
        tb_mesaj = 16'b0000111111110000;
        #10;
        tb_mesaj = 16'b1010011010011110;
        #10;
        tb_mesaj = 16'b0000001000100000;
        #10;
        tb_mesaj = 16'b1110000001101001;
        #10;
        tb_mesaj = 16'b0011001011000010;
        #10;
        tb_mesaj = 16'b0101010001000000;
        #10;
        tb_mesaj = 16'b1111110100000000;
        #10;
        tb_mesaj = 16'b1010011000000000;
        #10;
        tb_mesaj = 16'b1000110000110100;
        #10;
        tb_mesaj = 16'b0001000000010010;
        #10;
        tb_mesaj = 16'b1010010110100000;
        #10;
        tb_mesaj = 16'b0000111110101000;
        #10;
        tb_mesaj = 16'b0111001001011010;
        #10;
        $finish;
    end
endmodule