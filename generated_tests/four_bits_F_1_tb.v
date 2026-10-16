`timescale 1ns/1ps

module tb_four_bits_F;

  // Inputs
  reg a;
  reg b;
  reg c;
  reg d;

  // Output
  wire F;

  // Instantiate the Unit Under Test (UUT)
  four_bits_F uut (
    .F(F),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (F !== 0) $display("FAIL: Test case 1 failed, expected F=0, got F=%b", F);

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0; d = 0;
    #10;
    if (F !== 0) $display("FAIL: Test case 2 failed, expected F=0, got F=%b", F);

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0; d = 0;
    #10;
    if (F !== 0) $display("FAIL: Test case 3 failed, expected F=0, got F=%b", F);

    // Test case 4: Three inputs are 1
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (F !== 0) $display("FAIL: Test case 4 failed, expected F=0, got F=%b", F);

    // Test case 5: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (F !== 1) $display("FAIL: Test case 5 failed, expected F=1, got F=%b", F);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule