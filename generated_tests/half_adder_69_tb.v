`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire cout;
  wire sout;

  // Instantiate the half_adder module
  half_adder uut (
    .a(a),
    .b(b),
    .cout(cout),
    .sout(sout)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (cout !== 0 || sout !== 0) begin
      $display("FAIL: Test case 1 failed (a=0, b=0)");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (cout !== 0 || sout !== 1) begin
      $display("FAIL: Test case 2 failed (a=0, b=1)");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (cout !== 0 || sout !== 1) begin
      $display("FAIL: Test case 3 failed (a=1, b=0)");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (cout !== 1 || sout !== 0) begin
      $display("FAIL: Test case 4 failed (a=1, b=1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule