`timescale 1ns/1ps

module tb_nand1;

  // Inputs
  reg a_in;
  reg b_in;

  // Outputs
  wire y_out;

  // Instantiate the Unit Under Test (UUT)
  nand1 uut (
    .a_in(a_in),
    .b_in(b_in),
    .y_out(y_out)
  );

  initial begin
    // Test case 1: a_in = 0, b_in = 0
    a_in = 0; b_in = 0;
    #10;
    if (y_out !== 1) begin
      $display("FAIL: Test case 1 failed (0, 0) => y_out = %b", y_out);
      $finish;
    end

    // Test case 2: a_in = 0, b_in = 1
    a_in = 0; b_in = 1;
    #10;
    if (y_out !== 1) begin
      $display("FAIL: Test case 2 failed (0, 1) => y_out = %b", y_out);
      $finish;
    end

    // Test case 3: a_in = 1, b_in = 0
    a_in = 1; b_in = 0;
    #10;
    if (y_out !== 1) begin
      $display("FAIL: Test case 3 failed (1, 0) => y_out = %b", y_out);
      $finish;
    end

    // Test case 4: a_in = 1, b_in = 1
    a_in = 1; b_in = 1;
    #10;
    if (y_out !== 0) begin
      $display("FAIL: Test case 4 failed (1, 1) => y_out = %b", y_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule