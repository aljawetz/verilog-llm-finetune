`timescale 1ns/1ps

module tb_and_gate;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Output
  wire z;

  // Instantiate the Unit Under Test (UUT)
  and_gate uut (
    .a(a),
    .b(b),
    .c(c),
    .z(z)
  );

  initial begin
    // Test case 1: 0 AND 0 AND 0 = 0
    a = 0; b = 0; c = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 1 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 2: 0 AND 0 AND 1 = 0
    a = 0; b = 0; c = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 3: 0 AND 1 AND 1 = 0
    a = 0; b = 1; c = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 3 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 4: 1 AND 0 AND 1 = 0
    a = 1; b = 0; c = 1;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 4 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 5: 1 AND 1 AND 0 = 0
    a = 1; b = 1; c = 0;
    #10;
    if (z !== 0) begin
      $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);
      $finish;
    end

    // Test case 6: 1 AND 1 AND 1 = 1
    a = 1; b = 1; c = 1;
    #10;
    if (z !== 1) begin
      $display("FAIL: Test case 6 failed, expected z=1, got z=%b", z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule