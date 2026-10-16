`timescale 1ns/1ps

module tb_logic_gates;

  reg a;
  reg b;
  wire and_out;
  wire or_out;
  wire not_out;
  wire nand_out;
  wire nor_out;
  wire xor_out;
  wire xnor_out;

  // Instantiate the module under test (uut)
  logic_gates uut (
    .a(a),
    .b(b),
    .and_out(and_out),
    .or_out(or_out),
    .not_out(not_out),
    .nand_out(nand_out),
    .nor_out(nor_out),
    .xor_out(xor_out),
    .xnor_out(xnor_out)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (and_out !== 0 || or_out !== 0 || not_out !== 1 || nand_out !== 1 || nor_out !== 1 || xor_out !== 0 || xnor_out !== 1) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (and_out !== 0 || or_out !== 1 || not_out !== 1 || nand_out !== 1 || nor_out !== 0 || xor_out !== 1 || xnor_out !== 0) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (and_out !== 0 || or_out !== 1 || not_out !== 0 || nand_out !== 1 || nor_out !== 0 || xor_out !== 1 || xnor_out !== 0) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (and_out !== 1 || or_out !== 1 || not_out !== 0 || nand_out !== 0 || nor_out !== 0 || xor_out !== 0 || xnor_out !== 1) 
      $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule