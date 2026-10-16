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
    // Test case 1: 0 XOR 0 XOR 0 = 0
    x = 0; y = 0; z = 0;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 1 failed, expected 0 but got %b", result);
      $finish;
    end

    // Test case 2: 0 XOR 0 XOR 1 = 1
    x = 0; y = 0; z = 1;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 2 failed, expected 1 but got %b", result);
      $finish;
    end

    // Test case 3: 0 XOR 1 XOR 1 = 0
    x = 0; y = 1; z = 1;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 3 failed, expected 0 but got %b", result);
      $finish;
    end

    // Test case 4: 1 XOR 1 XOR 1 = 1
    x = 1; y = 1; z = 1;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 4 failed, expected 1 but got %b", result);
      $finish;
    end

    // Test case 5: 1 XOR 0 XOR 1 = 0
    x = 1; y = 0; z = 1;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 5 failed, expected 0 but got %b", result);
      $finish;
    end

    // Test case 6: 1 XOR 1 XOR 0 = 0
    x = 1; y = 1; z = 0;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 6 failed, expected 0 but got %b", result);
      $finish;
    end

    // Test case 7: 1 XOR 0 XOR 0 = 1
    x = 1; y = 0; z = 0;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 7 failed, expected 1 but got %b", result);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule