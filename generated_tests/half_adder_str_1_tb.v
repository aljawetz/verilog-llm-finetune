`timescale 1ns/1ps

module tb_half_adder_str;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire sum;
  wire c_out;

  // Instantiate the Unit Under Test (UUT)
  half_adder_str uut (
    .a(a),
    .b(b),
    .sum(sum),
    .c_out(c_out)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (sum !== 0 || c_out !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (sum !== 1 || c_out !== 0) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (sum !== 1 || c_out !== 0) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (sum !== 0 || c_out !== 1) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule