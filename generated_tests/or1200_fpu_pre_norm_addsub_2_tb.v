`timescale 1ns/1ps

module tb_or1200_fpu_pre_norm_addsub;

  reg clk_i;
  reg [31:0] opa_i;
  reg [31:0] opb_i;
  wire [27:0] fracta_28_o;
  wire [27:0] fractb_28_o;
  wire [7:0] exp_o;

  // Instantiate the Unit Under Test (UUT)
  or1200_fpu_pre_norm_addsub uut (
    .clk_i(clk_i),
    .opa_i(opa_i),
    .opb_i(opb_i),
    .fracta_28_o(fracta_28_o),
    .fractb_28_o(fractb_28_o),
    .exp_o(exp_o)
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
    if (exp_o !== 8'b10000001) $display("FAIL: Expected exp_o = 10000001, got %b", exp_o);
    if (fracta_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fracta_28_o = 00000000000000000000000000000000, got %b", fracta_28_o);
    if (fractb_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fractb_28_o = 00000000000000000000000000000000, got %b", fractb_28_o);

    // Test case 2: Denormalized numbers
    opa_i = 32'b00000000000000000000000000000001; // Smallest positive denormalized number
    opb_i = 32'b00000000000000000000000000000010; // Another denormalized number
    #10;
    if (exp_o !== 8'b00000000) $display("FAIL: Expected exp_o = 00000000, got %b", exp_o);
    if (fracta_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fracta_28_o = 00000000000000000000000000000000, got %b", fracta_28_o);
    if (fractb_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fractb_28_o = 00000000000000000000000000000000, got %b", fractb_28_o);

    // Test case 3: Zero inputs
    opa_i = 32'b00000000000000000000000000000000; // 0.0
    opb_i = 32'b00000000000000000000000000000000; // 0.0
    #10;
    if (exp_o !== 8'b00000000) $display("FAIL: Expected exp_o = 00000000, got %b", exp_o);
    if (fracta_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fracta_28_o = 00000000000000000000000000000000, got %b", fracta_28_o);
    if (fractb_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fractb_28_o = 00000000000000000000000000000000, got %b", fractb_28_o);

    // Test case 4: Different exponents
    opa_i = 32'b01000000100000000000000000000000; // 4.0
    opb_i = 32'b00111111100000000000000000000000; // 1.0
    #10;
    if (exp_o !== 8'b10000000) $display("FAIL: Expected exp_o = 10000000, got %b", exp_o);
    if (fracta_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fracta_28_o = 00000000000000000000000000000000, got %b", fracta_28_o);
    if (fractb_28_o !== 28'b00000000000000000000000000000000) $display("FAIL: Expected fractb_28_o = 00000000000000000000000000000000, got %b", fractb_28_o);

    $display("PASS");
    $finish;
  end

endmodule