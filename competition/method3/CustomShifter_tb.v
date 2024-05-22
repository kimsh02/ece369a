`timescale 1ns / 1ps

module CustomShifter_tb();
    
    reg [64*64*12-1:0] InputImg;
    reg [2:0] leftAmount, upAmount;
    wire [64*64*12-1:0] OutputImg;

    CustomShifter a1(InputImg, leftAmount, upAmount, OutputImg);

    integer i;
    initial begin
        for (i = 0; i < 64*64*12; i = i + 1) begin
            InputImg[i] = $random;
        end
        leftAmount <= 0;
        upAmount <= 0;
        #100;
        $display("Img[31, 23] = %d | leftAmount = %d | upAmount = %d | OutputImg[31, 23] = %d",
                 InputImg[12*(31*64+23)+11:12*(31*64+23)],
                 leftAmount,
                 upAmount,
                 OutputImg[12*(31*64+23)+11:12*(31*64+23)]);
        leftAmount <= 3;
        upAmount <= 2;
        #100;
        $display("Img[31, 23] = %d | leftAmount = %d | upAmount = %d | OutputImg[31, 23] = %d",
                 InputImg[12*(31*64+23)+11:12*(31*64+23)],
                 leftAmount,
                 upAmount,
                 OutputImg[12*(31*64+23)+11:12*(31*64+23)]);
        $display("Img[31, 23] = %d | leftAmount = %d | upAmount = %d | OutputImg[29, 20] = %d",
                 InputImg[12*(31*64+23)+11:12*(31*64+23)],
                 leftAmount,
                 upAmount,
                 OutputImg[12*(29*64+20)+11:12*(29*64+20)]);
    end

endmodule

