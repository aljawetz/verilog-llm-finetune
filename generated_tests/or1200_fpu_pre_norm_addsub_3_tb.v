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

  initial begin
    // Test case 1: Normalized numbers
    opa_i = 32'h41200000; // 10.0 in IEEE 754
    opb_i = 32'h41400000; // 12.0 in IEEE 754
    #10;
    if (exp_o !== 8'h41) $display("FAIL: Expected exp_o = 0x41, got exp_o = %h", exp_o);
    if (fracta_28_o !== 28'b0000000100100000000000000000) $display("FAIL: Expected fracta_28_o = 0x01200000, got fracta_28_o = %b", fracta_28_o);
    if (fractb_28_o !== 28'b0000000101000000000000000000) $display("FAIL: Expected fractb_28_o = 0x01400000, got fractb_28_o = %b", fractb_28_o);

    // Test case 2: Denormalized numbers
    opa_i = 32'h00000001; // Smallest positive denormalized number
    opb_i = 32'h41200000; // 10.0 in IEEE 754
    #10;
    if (exp_o !== 8'h41) $display("FAIL: Expected exp_o = 0x41, got exp_o = %h", exp_o);
    if (fracta_28_o !== 28'b0000000000000000000000000000) $display("FAIL: Expected fracta_28_o = 0x00000000, got fracta_28_o = %b", fracta_28_o);
    if (fractb_28_o !== 28'b0000000100100000000000000000) $display("FAIL: Expected fractb_28_o = 0x01200000, got fractb_28_o = %b", fractb_28_o);

    // Test case 3: Zero inputs
    opa_i = 32'h00000000; // 0.0 in IEEE 754
    opb_i = 32'h00000000; // 0.0 in IEEE 754
    #10;
    if (exp_o !== 8'h00) $display("FAIL: Expected exp_o = 0x00, got exp_o = %h", exp_o);
    if (fracta_28_o !== 28'b0000000000000000000000000000) $display("FAIL: Expected fracta_28_o = 0x00000000, got fracta_28_o = %b", fracta_28_o);
    if (fractb_28_o !== 28'b0000000000000000000000000000) $display("FAIL: Expected fractb_28_o = 0x00000000, got fractb_28_o = %b", fractb_28_o);

    // Test case 4: Mixed inputs
    opa_i = 32'h41200000; // 10.0 in IEEE 754
    opb_i = 32'hC1200000; // -10.0 in IEEE 754
    #10;
    if (exp_o !== 8'h41) $display("FAIL: Expected exp_o = 0x41, got exp_o = %h", exp_o);
    if (fracta_28_o !== 28'b0000000100100000000000000000) $display("FAIL: Expected fracta_28_o = 0x01200000, got fracta_28_o = %b", fracta_28_o);
    if (fractb_28_o !== 28'b1111111100100000000000000000) $display("FAIL: Expected fractb_28_o = 0xFE200000, got fractb_28_o = %b", fractb_28_o);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule