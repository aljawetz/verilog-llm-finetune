`timescale 1ns/1ps

module tb_xor_gate;

  reg a1;
  reg b1;
  wire c1;

  // Instantiate the module under test (uut)
  xor_gate uut (
    .a1(a1),
    .b1(b1),
    .c1(c1)
  );

  initial begin
    // Test case 1: a1 = 0, b1 = 0 => c1 should be 0
    a1 = 0; b1 = 0;
    #10;
    if (c1 !== 0) begin
      $display("FAIL: Test case 1 failed (0 XOR 0)");
      $finish;
    end

    // Test case 2: a1 = 0, b1 = 1 => c1 should be 1
    a1 = 0; b1 = 1;
    #10;
    if (c1 !== 1) begin
      $display("FAIL: Test case 2 failed (0 XOR 1)");
      $finish;
    end

    // Test case 3: a1 = 1, b1 = 0 => c1 should be 1
    a1 = 1; b1 = 0;
    #10;
    if (c1 !== 1) begin
      $display("FAIL: Test case 3 failed (1 XOR 0)");
      $finish;
    end

    // Test case 4: a1 = 1, b1 = 1 => c1 should be 0
    a1 = 1; b1 = 1;
    #10;
    if (c1 !== 0) begin
      $display("FAIL: Test case 4 failed (1 XOR 1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule