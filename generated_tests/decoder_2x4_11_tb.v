`timescale 1ns/1ps

module tb_decoder_2x4;

reg en;
reg [1:0] i;
wire [3:0] y;

decoder_2x4 uut (
    .y(y),
    .en(en),
    .i(i)
);

initial begin
    // Test case 1: Enable decoder and input 00
    en = 1;
    i = 2'b00;
    #10;
    if (y !== 4'b0001) begin
        $display("FAIL: Expected y=0001 for i=00 with en=1, got y=%b", y);
        $finish;
    end

    // Test case 2: Enable decoder and input 01
    i = 2'b01;
    #10;
    if (y !== 4'b0010) begin
        $display("FAIL: Expected y=0010 for i=01 with en=1, got y=%b", y);
        $finish;
    end

    // Test case 3: Enable decoder and input 10
    i = 2'b10;
    #10;
    if (y !== 4'b0100) begin
        $display("FAIL: Expected y=0100 for i=10 with en=1, got y=%b", y);
        $finish;
    end

    // Test case 4: Enable decoder and input 11
    i = 2'b11;
    #10;
    if (y !== 4'b1000) begin
        $display("FAIL: Expected y=1000 for i=11 with en=1, got y=%b", y);
        $finish;
    end

    // Test case 5: Disable decoder
    en = 0;
    i = 2'b00; // Input should not matter when disabled
    #10;
    if (y !== 4'b0000) begin
        $display("FAIL: Expected y=0000 when en=0, got y=%b", y);
        $finish;
    end

    // Test case 6: Check with different input while disabled
    i = 2'b11; // Input should not matter when disabled
    #10;
    if (y !== 4'b0000) begin
        $display("FAIL: Expected y=0000 when en=0, got y=%b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule