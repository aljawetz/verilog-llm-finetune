`timescale 1ns/1ps

module tb_four_bits_F;

  reg a, b, c, d;
  wire F;

  // Instantiate the module under test
  four_bits_F uut (
    .F(F),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
  );

  initial begin
    // Test case 1: All inputs are 1
    a = 1; b = 1; c = 1; d = 1;
    #10;
    if (F !== 1) begin
      $display("FAIL: Test case 1 failed, expected F=1 but got F=%b", F);
      $finish;
    end

    // Test case 2: One input is 0
    a = 1; b = 1; c = 1; d = 0;
    #10;
    if (F !== 0) begin
      $display("FAIL: Test case 2 failed, expected F=0 but got F=%b", F);
      $finish;
    end

    // Test case 3: Two inputs are 0
    a = 1; b = 0; c = 0; d = 1;
    #10;
    if (F !== 0) begin
      $display("FAIL: Test case 3 failed, expected F=0 but got F=%b", F);
      $finish;
    end

    // Test case 4: All inputs are 0
    a = 0; b = 0; c = 0; d = 0;
    #10;
    if (F !== 0) begin
      $display("FAIL: Test case 4 failed, expected F=0 but got F=%b", F);
      $finish;
    end

    // Test case 5: Three inputs are 1, one is 0
    a = 0; b = 1; c = 1; d = 1;
    #10;
    if (F !== 0) begin
      $display("FAIL: Test case 5 failed, expected F=0 but got F=%b", F);
      $finish;
    end

    // Test case 6: Random combination
    a = 1; b = 0; c = 1; d = 0;
    #10;
    if (F !== 0) begin
      $display("FAIL: Test case 6 failed, expected F=0 but got F=%b", F);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule