`timescale 1ns/1ps

module tb_and_gate;

  // Inputs
  reg b;
  reg c;

  // Outputs
  wire a;

  // Instantiate the Unit Under Test (UUT)
  and_gate uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: b = 0, c = 0
    b = 0; c = 0;
    #10;
    if (a !== 0) begin
      $display("FAIL: Test case 1 failed (b=0, c=0)");
      $finish;
    end

    // Test case 2: b = 0, c = 1
    b = 0; c = 1;
    #10;
    if (a !== 0) begin
      $display("FAIL: Test case 2 failed (b=0, c=1)");
      $finish;
    end

    // Test case 3: b = 1, c = 0
    b = 1; c = 0;
    #10;
    if (a !== 0) begin
      $display("FAIL: Test case 3 failed (b=1, c=0)");
      $finish;
    end

    // Test case 4: b = 1, c = 1
    b = 1; c = 1;
    #10;
    if (a !== 1) begin
      $display("FAIL: Test case 4 failed (b=1, c=1)");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule