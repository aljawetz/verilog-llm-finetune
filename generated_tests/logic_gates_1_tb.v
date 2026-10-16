`timescale 1ns/1ps

module tb_logic_gates;

  reg a;
  reg b;
  wire and_gate;
  wire or_gate;
  wire not_gate;
  wire nand_gate;
  wire nor_gate;
  wire xor_gate;
  wire xnor_gate;

  logic_gates uut (
    .a(a),
    .b(b),
    .and_gate(and_gate),
    .or_gate(or_gate),
    .not_gate(not_gate),
    .nand_gate(nand_gate),
    .nor_gate(nor_gate),
    .xor_gate(xor_gate),
    .xnor_gate(xnor_gate)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (and_gate !== 0 || or_gate !== 0 || not_gate !== 1 || nand_gate !== 1 || nor_gate !== 1 || xor_gate !== 0 || xnor_gate !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (and_gate !== 0 || or_gate !== 1 || not_gate !== 1 || nand_gate !== 1 || nor_gate !== 0 || xor_gate !== 1 || xnor_gate !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (and_gate !== 0 || or_gate !== 1 || not_gate !== 0 || nand_gate !== 1 || nor_gate !== 0 || xor_gate !== 1 || xnor_gate !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (and_gate !== 1 || or_gate !== 1 || not_gate !== 0 || nand_gate !== 0 || nor_gate !== 0 || xor_gate !== 0 || xnor_gate !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule