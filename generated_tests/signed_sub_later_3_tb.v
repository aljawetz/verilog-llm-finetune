`timescale 1ns/1ps

module tb_signed_sub_later;

  reg clk;
  reg rst_n;
  reg [3:0] aIn;
  reg [3:0] bIn;
  wire signed [4:0] subOut;

  signed_sub_later uut (
    .clk(clk),
    .rst_n(rst_n),
    .aIn(aIn),
    .bIn(bIn),
    .subOut(subOut)
  );

  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    aIn = 0;
    bIn = 0;

    // Release reset
    #5 rst_n = 1;

    // Test cases
    // Test case 1: 3 - 2 = 1
    aIn = 4'b0011; // 3
    bIn = 4'b0010; // 2
    #10;
    if (subOut !== 5'b00001) $display("FAIL: Expected 1, got %b", subOut);

    // Test case 2: -1 - (-2) = 1
    aIn = 4'b1111; // -1
    bIn = 4'b1110; // -2
    #10;
    if (subOut !== 5'b00001) $display("FAIL: Expected 1, got %b", subOut);

    // Test case 3: 2 - 3 = -1
    aIn = 4'b0010; // 2
    bIn = 4'b0011; // 3
    #10;
    if (subOut !== 5'b11111) $display("FAIL: Expected -1, got %b", subOut);

    // Test case 4: 7 - 5 = 2
    aIn = 4'b0111; // 7
    bIn = 4'b0101; // 5
    #10;
    if (subOut !== 5'b00010) $display("FAIL: Expected 2, got %b", subOut);

    // Test case 5: 0 - 0 = 0
    aIn = 4'b0000; // 0
    bIn = 4'b0000; // 0
    #10;
    if (subOut !== 5'b00000) $display("FAIL: Expected 0, got %b", subOut);

    // If all tests pass
    $display("PASS");
    $finish;
  end

  always #5 clk = ~clk; // Clock generation

endmodule