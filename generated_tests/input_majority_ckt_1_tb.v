`timescale 1ns/1ps

module tb_input_majority_ckt;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire out;

  // Instantiate the Unit Under Test (UUT)
  input_majority_ckt uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
  );

  initial begin
    // Test case 1: 1, 1, 0 -> out should be 1
    a = 1; b = 1; c = 0;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 1, 0, 1 -> out should be 1
    a = 1; b = 0; c = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 0, 1, 1 -> out should be 1
    a = 0; b = 1; c = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 1, 1, 1 -> out should be 1
    a = 1; b = 1; c = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 0, 0, 1 -> out should be 0
    a = 0; b = 0; c = 1;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 0, 1, 0 -> out should be 0
    a = 0; b = 1; c = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 0, 0, 0 -> out should be 0
    a = 0; b = 0; c = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule