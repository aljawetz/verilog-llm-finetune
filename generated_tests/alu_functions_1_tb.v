`timescale 1ns/1ps

module tb_alu_functions;

  reg [31:0] inp_a;
  reg [31:0] inp_b;
  wire [31:0] add_out;
  wire [31:0] sub_out;
  wire [31:0] and_out;
  wire [31:0] or_out;
  wire [31:0] xor_out;
  wire [31:0] sfl_out;
  wire [31:0] sfr_out;
  wire [31:0] chk_out;
  wire cf;
  wire nf;
  wire zf;
  wire vf;

  alu_functions uut (
    .inp_a(inp_a),
    .inp_b(inp_b),
    .add_out(add_out),
    .sub_out(sub_out),
    .and_out(and_out),
    .or_out(or_out),
    .xor_out(xor_out),
    .sfl_out(sfl_out),
    .sfr_out(sfr_out),
    .chk_out(chk_out),
    .cf(cf),
    .nf(nf),
    .zf(zf),
    .vf(vf)
  );

  initial begin
    // Test case 1: Addition
    inp_a = 32'h00000001; 
    inp_b = 32'h00000001; 
    #10;
    if (add_out !== 32'h00000002) $display("FAIL: Addition test failed");
    
    // Test case 2: Subtraction
    inp_a = 32'h00000002; 
    inp_b = 32'h00000001; 
    #10;
    if (sub_out !== 32'h00000001) $display("FAIL: Subtraction test failed");

    // Test case 3: AND operation
    inp_a = 32'hFFFFFFFF; 
    inp_b = 32'h00000000; 
    #10;
    if (and_out !== 32'h00000000) $display("FAIL: AND test failed");

    // Test case 4: OR operation
    inp_a = 32'h00000000; 
    inp_b = 32'hFFFFFFFF; 
    #10;
    if (or_out !== 32'hFFFFFFFF) $display("FAIL: OR test failed");

    // Test case 5: XOR operation
    inp_a = 32'hFFFFFFFF; 
    inp_b = 32'hFFFFFFFF; 
    #10;
    if (xor_out !== 32'h00000000) $display("FAIL: XOR test failed");

    // Test case 6: Shift Left
    inp_a = 32'h00000001; 
    #10;
    if (sfl_out !== 32'h00000002) $display("FAIL: Shift Left test failed");

    // Test case 7: Shift Right
    inp_a = 32'h00000002; 
    #10;
    if (sfr_out !== 32'h00000001) $display("FAIL: Shift Right test failed");

    // Test case 8: Check output
    inp_a = 32'h12345678; 
    #10;
    if (chk_out !== 32'h12345678) $display("FAIL: Check output test failed");

    // Test case 9: Carry flag
    inp_a = 32'hFFFFFFFF; 
    inp_b = 32'h00000001; 
    #10;
    if (cf !== 1'b1) $display("FAIL: Carry flag test failed");

    // Test case 10: Zero flag
    inp_a = 32'h00000000; 
    inp_b = 32'h00000000; 
    #10;
    if (zf !== 1'b1) $display("FAIL: Zero flag test failed");

    // Test case 11: Negative flag
    inp_a = 32'h80000000; 
    inp_b = 32'h00000000; 
    #10;
    if (nf !== 1'b1) $display("FAIL: Negative flag test failed");

    // Test case 12: Overflow flag
    inp_a = 32'h7FFFFFFF; 
    inp_b = 32'h00000001; 
    #10;
    if (vf !== 1'b1) $display("FAIL: Overflow flag test failed");

    $display("PASS");
    $finish;
  end

endmodule