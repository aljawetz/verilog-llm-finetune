`timescale 1ns/1ps

module tb_or1200_fpu_pre_norm_mul;

  reg clk_i;
  reg [31:0] opa_i;
  reg [31:0] opb_i;
  wire [9:0] exp_10_o;
  wire [23:0] fracta_24_o;
  wire [23:0] fractb_24_o;

  // Instantiate the Unit Under Test (UUT)
  or1200_fpu_pre_norm_mul uut (
    .clk_i(clk_i),
    .opa_i(opa_i),
    .opb_i(opb_i),
    .exp_10_o(exp_10_o),
    .fracta_24_o(fracta_24_o),
    .fractb_24_o(fractb_24_o)
  );

  // Clock generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Test case 1: Normalized numbers
    opa_i = 32'b01000000101000000000000000000000; // 5.0
    opb_i = 32'b01000000010010010000111111011011; // 3.14159
    #10;
    if (exp_10_o !== 10'b0000001010) $display("FAIL: Test case 1 exp_10_o mismatch");
    if (fracta_24_o !== 24'b00000000001000000000000000) $display("FAIL: Test case 1 fracta_24_o mismatch");
    if (fractb_24_o !== 24'b00000000010010010000111111) $display("FAIL: Test case 1 fractb_24_o mismatch");

    // Test case 2: Denormalized numbers
    opa_i = 32'b00000000000000000000000000000001; // Denormalized
    opb_i = 32'b00000000000000000000000000000010; // Denormalized
    #10;
    if (exp_10_o !== 10'b0000000000) $display("FAIL: Test case 2 exp_10_o mismatch");
    if (fracta_24_o !== 24'b00000000000000000000000001) $display("FAIL: Test case 2 fracta_24_o mismatch");
    if (fractb_24_o !== 24'b00000000000000000000000010) $display("FAIL: Test case 2 fractb_24_o mismatch");

    // Test case 3: Mixed normalized and denormalized
    opa_i = 32'b01000000101000000000000000000000; // 5.0
    opb_i = 32'b00000000000000000000000000000001; // Denormalized
    #10;
    if (exp_10_o !== 10'b0000001010) $display("FAIL: Test case 3 exp_10_o mismatch");
    if (fracta_24_o !== 24'b00000000001000000000000000) $display("FAIL: Test case 3 fracta_24_o mismatch");
    if (fractb_24_o !== 24'b00000000000000000000000001) $display("FAIL: Test case 3 fractb_24_o mismatch");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule