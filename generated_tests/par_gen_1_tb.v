`timescale 1ns/1ps

module tb_par_gen;
  reg x;
  reg y;
  reg z;
  wire result;

  // Instantiate the module under test (uut)
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
      $display("FAIL: Test case 1 failed (0, 0, 0)");
      $finish;
    end

    // Test case 2: x=0, y=0, z=1 -> result should be 1
    x = 0; y = 0; z = 1;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 2 failed (0, 0, 1)");
      $finish;
    end

    // Test case 3: x=0, y=1, z=0 -> result should be 1
    x = 0; y = 1; z = 0;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 3 failed (0, 1, 0)");
      $finish;
    end

    // Test case 4: x=0, y=1, z=1 -> result should be 0
    x = 0; y = 1; z = 1;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 4 failed (0, 1, 1)");
      $finish;
    end

    // Test case 5: x=1, y=0, z=0 -> result should be 1
    x = 1; y = 0; z = 0;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 5 failed (1, 0, 0)");
      $finish;
    end

    // Test case 6: x=1, y=0, z=1 -> result should be 0
    x = 1; y = 0; z = 1;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 6 failed (1, 0, 1)");
      $finish;
    end

    // Test case 7: x=1, y=1, z=0 -> result should be 0
    x = 1; y = 1; z = 0;
    #10;
    if (result !== 0) begin
      $display("FAIL: Test case 7 failed (1, 1, 0)");
      $finish;
    end

    // Test case 8: x=1, y=1, z=1 -> result should be 1
    x = 1; y = 1; z = 1;
    #10;
    if (result !== 1) begin
      $display("FAIL: Test case 8 failed (1, 1, 1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule