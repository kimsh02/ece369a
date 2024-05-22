`timescale 1ns / 1ps

module CustomAdders_tb();
    
    reg [64*64*12-1:0] InputImgA, InputImgB;
    wire [64*64*12-1:0] OutputImg;
    reg SubImages;
    reg AbsImgA;

    CustomAdders a1(InputImgA, InputImgB, OutputImg,
                    SubImages, AbsImgA);

    integer i;
    initial begin
        InputImgA <= 0;
        InputImgB <= 0;
        SubImages <= 0;
        AbsImgA <= 0;
        #10;
        $display("ImgA[0] = %d | ImgB[0] = %d | SubImages = %d | AbsImgA = %d | OutputImg[0] = %d",
                 InputImgA[0*12+11:0*12],
                 InputImgB[0*12+11:0*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[0*12+11:0*12]);
        $display("ImgA[472] = %d | ImgB[472] = %d | SubImages = %d | AbsImgA = %d | OutputImg[472] = %d",
                 InputImgA[472*12+11:472*12],
                 InputImgB[472*12+11:472*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[472*12+11:472*12]);
        $display("ImgA[123] = %d | ImgB[123] = %d | SubImages = %d | AbsImgA = %d | OutputImg[123] = %d",
                 InputImgA[123*12+11:123*12],
                 InputImgB[123*12+11:123*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[123*12+11:123*12]);
        $display("");
        #100;
        for (i = 0; i < 64*64*12; i = i + 1) begin
            InputImgA[i] = $random;
            InputImgB[i] = $random;
        end
        #10;
        $display("ImgA[0] = %d | ImgB[0] = %d | SubImages = %d | AbsImgA = %d | OutputImg[0] = %d",
                 InputImgA[0*12+11:0*12],
                 InputImgB[0*12+11:0*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[0*12+11:0*12]);
        $display("ImgA[472] = %d | ImgB[472] = %d | SubImages = %d | AbsImgA = %d | OutputImg[472] = %d",
                 InputImgA[472*12+11:472*12],
                 InputImgB[472*12+11:472*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[472*12+11:472*12]);
        $display("ImgA[123] = %d | ImgB[123] = %d | SubImages = %d | AbsImgA = %d | OutputImg[123] = %d",
                 InputImgA[123*12+11:123*12],
                 InputImgB[123*12+11:123*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[123*12+11:123*12]);
        $display("");
        #100;
        SubImages <= 1;
        AbsImgA <= 0;
        #10;
        $display("ImgA[0] = %d | ImgB[0] = %d | SubImages = %d | AbsImgA = %d | OutputImg[0] = %d",
                 InputImgA[0*12+11:0*12],
                 InputImgB[0*12+11:0*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[0*12+11:0*12]);
        $display("ImgA[472] = %d | ImgB[472] = %d | SubImages = %d | AbsImgA = %d | OutputImg[472] = %d",
                 InputImgA[472*12+11:472*12],
                 InputImgB[472*12+11:472*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[472*12+11:472*12]);
        $display("ImgA[123] = %d | ImgB[123] = %d | SubImages = %d | AbsImgA = %d | OutputImg[123] = %d",
                 InputImgA[123*12+11:123*12],
                 InputImgB[123*12+11:123*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[123*12+11:123*12]);
        $display("");
        #100;
        SubImages <= 0;
        AbsImgA <= 1;
        #10;
        $display("ImgA[0] = %d | ImgB[0] = %d | SubImages = %d | AbsImgA = %d | OutputImg[0] = %d",
                 InputImgA[0*12+11:0*12],
                 InputImgB[0*12+11:0*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[0*12+11:0*12]);
        $display("ImgA[472] = %d | ImgB[472] = %d | SubImages = %d | AbsImgA = %d | OutputImg[472] = %d",
                 InputImgA[472*12+11:472*12],
                 InputImgB[472*12+11:472*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[472*12+11:472*12]);
        $display("ImgA[123] = %d | ImgB[123] = %d | SubImages = %d | AbsImgA = %d | OutputImg[123] = %d",
                 InputImgA[123*12+11:123*12],
                 InputImgB[123*12+11:123*12],
                 SubImages,
                 AbsImgA,
                 OutputImg[123*12+11:123*12]);
        $display("");
    end

endmodule

