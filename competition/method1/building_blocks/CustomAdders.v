`timescale 1ns / 1ps

module CustomAdders(InputImgA, InputImgB, OutputImg,
                    SubImages, AbsImgA);

    input [64*64*12-1:0] InputImgA, InputImgB;
    output reg [64*64*12-1:0] OutputImg;
    input SubImages; // Whether to subtract the images.
    input AbsImgA; // Whether to just abs InputImgA and output in OutputImg.

    //wire [64*64-1:0] dummyWires;

    //wire [64*64*12-1:0] invertedImgB;
    //assign invertedImgB = ~InputImgB;

    //wire [64*64-1:0] shouldAbsA;

    //genvar i;
    //generate
    //    for (i = 0; i < 64*64; i = i + 1) begin
    //        assign shouldAbsA[i] = AbsImgA & InputImgA[i*12+11];
    //        RippleCarryAdder a1(({12{~shouldAbsA[i]}} & InputImgA[i*12+11:i*12]) | ({12{shouldAbsA[i]}} & ~InputImgA[i*12+11:i*12]),
    //                            (InputImgB[i*12+11:i*12] & {12{~AbsImgA & ~SubImages}}) | (invertedImgB[i*12+11:i*12] & {12{~AbsImgA & SubImages}}),
    //                            SubImages | shouldAbsA[i],
    //                            OutputImg[i*12+11:i*12],
    //                            dummyWires[i]);
    //    end
    //endgenerate

    integer i;
    always @(*) begin
        if (AbsImgA) begin
            for (i = 0; i < 64*64; i = i + 1) begin
                if (InputImgA[i*12+11]) begin
                    // Need to invert.
                    OutputImg[i*12 +: 12] <= -InputImgA[i*12 +: 12];
                end else begin
                    // No need to invert.
                    OutputImg[i*12 +: 12] <= InputImgA[i*12 +: 12];
                end
            end
        end else if (SubImages) begin
            for (i = 0; i < 64*64; i = i + 1) begin
                OutputImg[i*12 +: 12] <= InputImgA[i*12 +: 12] - InputImgB[i*12 +: 12];
            end
        end else begin
            for (i = 0; i < 64*64; i = i + 1) begin
                OutputImg[i*12 +: 12] <= InputImgA[i*12 +: 12] + InputImgB[i*12 +: 12];
            end
        end
    end

endmodule

