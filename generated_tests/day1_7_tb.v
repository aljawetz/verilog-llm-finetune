`timescale 1ns/1ps

module tb_day1;

  // Inputs
  reg in1;
  reg in2;
  reg in3;

  // Outputs
  wire out;

  // Instantiate the Unit Under Test (UUT)
  day1 uut (
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out(out)
  );

  initial begin
    // Test case 1: in1=0, in2=0, in3=0 -> out should be 0
    in1 = 0; in2 = 0; in3 = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 1 failed, expected out=0, got out=%b", out);

    // Test case 2: in1=0, in2=0, in3=1 -> out should be 1
    in1 = 0; in2 = 0; in3 = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 2 failed, expected out=1, got out=%b", out);

    // Test case 3: in1=0, in2=1, in3=0 -> out should be 1
    in1 = 0; in2 = 1; in3 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 3 failed, expected out=1, got out=%b", out);

    // Test case 4: in1=0, in2=1, in3=1 -> out should be 0
    in1 = 0; in2 = 1; in3 = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 4 failed, expected out=0, got out=%b", out);

    // Test case 5: in1=1, in2=0, in3=0 -> out should be 1
    in1 = 1; in2 = 0; in3 = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 5 failed, expected out=1, got out=%b", out);

    // Test case 6: in1=1, in2=0, in3=1 -> out should be 0
    in1 = 1; in2 = 0; in3 = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 6 failed, expected out=0, got out=%b", out);

    // Test case 7: in1=1, in2=1, in3=0 -> out should be 0
    in1 = 1; in2 = 1; in3 = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 7 failed, expected out=0, got out=%b", out);

    // Test case 8: in1=1, in2=1, in3=1 -> out should be 1
    in1 = 1; in2 = 1; in3 = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 8 failed, expected out=1, got out=%b", out);

    $display("PASS");
    $finish;
  end

endmodule