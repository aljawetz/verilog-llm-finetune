`timescale 1ns/1ps

module tb_par_gen;

  // Inputs
  reg x;
  reg y;
  reg z;

  // Output
  wire result;

  // Instantiate the Unit Under Test (UUT)
  par_gen uut (
    .x(x),
    .y(y),
    .z(z),
    .result(result)
  );

  initial begin
    // Test case 1: x=0, y=0, z=0 -> result should be 0
    x = 0; y = 0; z = 0;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 1 failed, expected 0, got %b", result);
      $finish;
    end

    // Test case 2: x=0, y=0, z=1 -> result should be 1
    x = 0; y = 0; z = 1;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 2 failed, expected 1, got %b", result);
      $finish;
    end

    // Test case 3: x=0, y=1, z=0 -> result should be 1
    x = 0; y = 1; z = 0;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 3 failed, expected 1, got %b", result);
      $finish;
    end

    // Test case 4: x=0, y=1, z=1 -> result should be 0
    x = 0; y = 1; z = 1;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 4 failed, expected 0, got %b", result);
      $finish;
    end

    // Test case 5: x=1, y=0, z=0 -> result should be 1
    x = 1; y = 0; z = 0;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 5 failed, expected 1, got %b", result);
      $finish;
    end

    // Test case 6: x=1, y=0, z=1 -> result should be 0
    x = 1; y = 0; z = 1;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 6 failed, expected 0, got %b", result);
      $finish;
    end

    // Test case 7: x=1, y=1, z=0 -> result should be 0
    x = 1; y = 1; z = 0;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 7 failed, expected 0, got %b", result);
      $finish;
    end

    // Test case 8: x=1, y=1, z=1 -> result should be 1
    x = 1; y = 1; z = 1;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 8 failed, expected 1, got %b", result);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule