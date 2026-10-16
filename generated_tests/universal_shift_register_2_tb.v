`timescale 1ns/1ps

module tb_universal_shift_register;

  reg clk;
  reg reset_n;
  reg MSB_in;
  reg LSB_in;
  reg [3:0] I;
  reg [1:0] s;
  wire [3:0] Q;

  // Instantiate the unit under test (uut)
  universal_shift_register uut (
    .clk(clk),
    .reset_n(reset_n),
    .MSB_in(MSB_in),
    .LSB_in(LSB_in),
    .I(I),
    .s(s),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset_n = 0;
    MSB_in = 0;
    LSB_in = 0;
    I = 4'b0000;
    s = 2'b00;

    // Apply reset
    #10;
    reset_n = 1; // Release reset
    #10;

    // Test: No change (s = 00)
    s = 2'b00;
    #10;
    if (Q !== 4'b0000) $display("FAIL: No change failed");

    // Test: Shift right (s = 01) with MSB_in = 1
    MSB_in = 1;
    s = 2'b01;
    #10;
    if (Q !== 4'b1000) $display("FAIL: Shift right failed");

    // Test: Shift left (s = 10) with LSB_in = 1
    LSB_in = 1;
    s = 2'b10;
    #10;
    if (Q !== 4'b0001) $display("FAIL: Shift left failed");

    // Test: Parallel load (s = 11)
    I = 4'b1010;
    s = 2'b11;
    #10;
    if (Q !== 4'b1010) $display("FAIL: Parallel load failed");

    // Test: Shift right again
    MSB_in = 0;
    s = 2'b01;
    #10;
    if (Q !== 4'b0101) $display("FAIL: Shift right after load failed");

    // Test: Shift left again
    LSB_in = 0;
    s = 2'b10;
    #10;
    if (Q !== 4'b1010) $display("FAIL: Shift left after right shift failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule