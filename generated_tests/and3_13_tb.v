`timescale 1ns/1ps

module tb_and3;

  // Inputs
  reg w;
  reg x;
  reg y;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  and3 uut (
    .z(z),
    .w(w),
    .x(x),
    .y(y)
  );

  initial begin
    // Test case 1: All inputs are 0
    w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 1 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 2: One input is 1
    w = 1; x = 0; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 3: Two inputs are 1
    w = 1; x = 1; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 4: All inputs are 1
    w = 1; x = 1; y = 1;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 4 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // Test case 5: Mixed inputs
    w = 1; x = 0; y = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 6: Mixed inputs
    w = 0; x = 1; y = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 6 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 7: All inputs are 0 again
    w = 0; x = 0; y = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 7 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule