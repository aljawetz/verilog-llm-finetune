`timescale 1ns/1ps

module tb_Xor;

  // Inputs
  reg in_a;
  reg in_b;

  // Output
  wire o_xor;

  // Instantiate the Unit Under Test (UUT)
  Xor uut (
    .in_a(in_a),
    .in_b(in_b),
    .o_xor(o_xor)
  );

  initial begin
    // Test case 1: in_a = 0, in_b = 0
    in_a = 0; in_b = 0;
    #10;
    if (o_xor !== 1'b0) begin
      $display("FAIL: Test case 1 failed (0 XOR 0)");
      $finish;
    end

    // Test case 2: in_a = 0, in_b = 1
    in_a = 0; in_b = 1;
    #10;
    if (o_xor !== 1'b1) begin
      $display("FAIL: Test case 2 failed (0 XOR 1)");
      $finish;
    end

    // Test case 3: in_a = 1, in_b = 0
    in_a = 1; in_b = 0;
    #10;
    if (o_xor !== 1'b1) begin
      $display("FAIL: Test case 3 failed (1 XOR 0)");
      $finish;
    end

    // Test case 4: in_a = 1, in_b = 1
    in_a = 1; in_b = 1;
    #10;
    if (o_xor !== 1'b0) begin
      $display("FAIL: Test case 4 failed (1 XOR 1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule