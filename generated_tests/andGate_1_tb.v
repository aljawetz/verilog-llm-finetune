`timescale 1ns/1ps

module tb_andGate;

  // Inputs
  reg i_a;
  reg i_b;

  // Output
  wire o_c;

  // Instantiate the Unit Under Test (UUT)
  andGate uut (
    .i_a(i_a),
    .i_b(i_b),
    .o_c(o_c)
  );

  initial begin
    // Test case 1: 0 AND 0 = 0
    i_a = 0; i_b = 0;
    #10;
    if (o_c !== 0) begin
      $display("FAIL: Test case 1 failed, expected o_c = 0, got o_c = %b", o_c);
      $finish;
    end

    // Test case 2: 0 AND 1 = 0
    i_a = 0; i_b = 1;
    #10;
    if (o_c !== 0) begin
      $display("FAIL: Test case 2 failed, expected o_c = 0, got o_c = %b", o_c);
      $finish;
    end

    // Test case 3: 1 AND 0 = 0
    i_a = 1; i_b = 0;
    #10;
    if (o_c !== 0) begin
      $display("FAIL: Test case 3 failed, expected o_c = 0, got o_c = %b", o_c);
      $finish;
    end

    // Test case 4: 1 AND 1 = 1
    i_a = 1; i_b = 1;
    #10;
    if (o_c !== 1) begin
      $display("FAIL: Test case 4 failed, expected o_c = 1, got o_c = %b", o_c);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule