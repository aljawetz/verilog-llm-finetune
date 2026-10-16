`timescale 1ns/1ps

module tb_halfadder_dataflow;

  // Inputs
  reg a_in;
  reg b_in;

  // Outputs
  wire c_out;
  wire s_out;

  // Instantiate the Unit Under Test (UUT)
  halfadder_dataflow uut (
    .a_in(a_in),
    .b_in(b_in),
    .c_out(c_out),
    .s_out(s_out)
  );

  initial begin
    // Test case 1: a_in = 0, b_in = 0
    a_in = 0; b_in = 0;
    #10;
    if (c_out !== 0 || s_out !== 0) begin
      $display("FAIL: Test case 1 failed (0, 0)");
      $finish;
    end

    // Test case 2: a_in = 0, b_in = 1
    a_in = 0; b_in = 1;
    #10;
    if (c_out !== 0 || s_out !== 1) begin
      $display("FAIL: Test case 2 failed (0, 1)");
      $finish;
    end

    // Test case 3: a_in = 1, b_in = 0
    a_in = 1; b_in = 0;
    #10;
    if (c_out !== 0 || s_out !== 1) begin
      $display("FAIL: Test case 3 failed (1, 0)");
      $finish;
    end

    // Test case 4: a_in = 1, b_in = 1
    a_in = 1; b_in = 1;
    #10;
    if (c_out !== 1 || s_out !== 0) begin
      $display("FAIL: Test case 4 failed (1, 1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule