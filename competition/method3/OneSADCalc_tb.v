`timescale 1ns / 1ps

module OneSADCalc_tb();

    reg [4*4*8-1:0] Crop;
    reg [4*4*8-1:0] Window;
    wire [11:0] SADVal;

    OneSADCalc a1(Crop, Window, SADVal);

    initial begin
        Crop[0*8 +: 8] = 126;
        Crop[1*8 +: 8] = 91;
        Crop[2*8 +: 8] = 45;
        Crop[3*8 +: 8] = 122;
        Crop[4*8 +: 8] = 254;
        Crop[5*8 +: 8] = 226;
        Crop[6*8 +: 8] = 63;
        Crop[7*8 +: 8] = 98;
        Crop[8*8 +: 8] = 138;
        Crop[9*8 +: 8] = 124;
        Crop[10*8 +: 8] = 235;
        Crop[11*8 +: 8] = 235;
        Crop[12*8 +: 8] = 54;
        Crop[13*8 +: 8] = 225;
        Crop[14*8 +: 8] = 68;
        Crop[15*8 +: 8] = 162;

        Window[0*8 +: 8] = 13;
        Window[1*8 +: 8] = 95;
        Window[2*8 +: 8] = 197;
        Window[3*8 +: 8] = 122;
        Window[4*8 +: 8] = 148;
        Window[5*8 +: 8] = 82;
        Window[6*8 +: 8] = 222;
        Window[7*8 +: 8] = 129;
        Window[8*8 +: 8] = 144;
        Window[9*8 +: 8] = 18;
        Window[10*8 +: 8] = 74;
        Window[11*8 +: 8] = 206;
        Window[12*8 +: 8] = 61;
        Window[13*8 +: 8] = 220;
        Window[14*8 +: 8] = 32;
        Window[15*8 +: 8] = 0;
        #100;
        $display("%d", SADVal);
    end

endmodule

