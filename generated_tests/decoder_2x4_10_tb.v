`timescale 1ns/1ps

module tb_decoder_2x4;

reg En;
reg [1:0] W;
wire [3:0] Y;

decoder_2x4 uut (
    .En(En),
    .W(W),
    .Y(Y)
);

initial begin
    // Test case 1: Enable and select W = 0
    En = 1;
    W = 2'b00;
    #10;
    if (Y !== 4'b1000) begin
        $display("FAIL: Test case 1 failed, expected Y = 1000, got Y = %b", Y);
        $finish;
    end

    // Test case 2: Enable and select W = 1
    W = 2'b01;
    #10;
    if (Y !== 4'b0100) begin
        $display("FAIL: Test case 2 failed, expected Y = 0100, got Y = %b", Y);
        $finish;
    end

    // Test case 3: Enable and select W = 2
    W = 2'b10;
    #10;
    if (Y !== 4'b0010) begin
        $display("FAIL: Test case 3 failed, expected Y = 0010, got Y = %b", Y);
        $finish;
    end

    // Test case 4: Enable and select W = 3
    W = 2'b11;
    #10;
    if (Y !== 4'b0001) begin
        $display("FAIL: Test case 4 failed, expected Y = 0001, got Y = %b", Y);
        $finish;
    end

    // Test case 5: Disable the decoder
    En = 0;
    W = 2'b00; // W value should not matter when En is 0
    #10;
    if (Y !== 4'b0000) begin
        $display("FAIL: Test case 5 failed, expected Y = 0000, got Y = %b", Y);
        $finish;
    end

    // Test case 6: Check default case when En is enabled
    En = 1;
    W = 2'bxx; // Invalid W value
    #10;
    if (Y !== 4'b0000) begin
        $display("FAIL: Test case 6 failed, expected Y = 0000, got Y = %b", Y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule