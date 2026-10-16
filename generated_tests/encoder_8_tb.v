`timescale 1ns/1ps

module tb_encoder;

reg [7:0] din;
reg en;
wire [2:0] y;

// Instantiate the encoder module
encoder uut (
    .din(din),
    .en(en),
    .y(y)
);

// Clock generation (not needed for this design but included for completeness)
reg clk;
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Test case 1: Enable with one-hot input
    en = 1;
    din = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Expected y=000 for din=00000001, got y=%b", y);

    din = 8'b00000010; #10;
    if (y !== 3'b001) $display("FAIL: Expected y=001 for din=00000010, got y=%b", y);

    din = 8'b00000100; #10;
    if (y !== 3'b010) $display("FAIL: Expected y=010 for din=00000100, got y=%b", y);

    din = 8'b00001000; #10;
    if (y !== 3'b011) $display("FAIL: Expected y=011 for din=00001000, got y=%b", y);

    din = 8'b00010000; #10;
    if (y !== 3'b100) $display("FAIL: Expected y=100 for din=00010000, got y=%b", y);

    din = 8'b00100000; #10;
    if (y !== 3'b101) $display("FAIL: Expected y=101 for din=00100000, got y=%b", y);

    din = 8'b01000000; #10;
    if (y !== 3'b110) $display("FAIL: Expected y=110 for din=01000000, got y=%b", y);

    din = 8'b10000000; #10;
    if (y !== 3'b111) $display("FAIL: Expected y=111 for din=10000000, got y=%b", y);

    // Test case 2: Disable the encoder
    en = 0; din = 8'b00000001; #10;
    if (y !== 3'bzzz) $display("FAIL: Expected y=zzz when en=0, got y=%b", y);

    // Test case 3: Disable with no active input
    din = 8'b00000000; #10;
    if (y !== 3'bzzz) $display("FAIL: Expected y=zzz when en=0 and din=00000000, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule