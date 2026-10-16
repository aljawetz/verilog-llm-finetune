`timescale 1ns/1ps

module tb_HA;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire sout;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  HA uut (
    .sout(sout),
    .cout(cout),
    .a(a),
    .b(b)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (sout !== 0 || cout !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (sout !== 1 || cout !== 0) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (sout !== 1 || cout !== 0) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (sout !== 0 || cout !== 1) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule