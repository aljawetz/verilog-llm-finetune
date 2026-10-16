`timescale 1ns/1ps

module tb_inverter_cmos;

  // Inputs
  reg control;
  reg in1;
  reg in2;

  // Outputs
  wire out;

  // Instantiate the Unit Under Test (UUT)
  inverter_cmos uut (
    .control(control),
    .in1(in1),
    .in2(in2),
    .out(out)
  );

  initial begin
    // Initialize Inputs
    control = 0;
    in1 = 0;
    in2 = 0;

    // Test case 1: control = 0, in1 = 0, in2 = 0
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 1 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 2: control = 0, in1 = 1, in2 = 0
    in1 = 1; in2 = 0; control = 0;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: control = 1, in1 = 0, in2 = 1
    in1 = 0; in2 = 1; control = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // Test case 4: control = 1, in1 = 1, in2 = 0
    in1 = 1; in2 = 0; control = 1;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 5: control = 0, in1 = 0, in2 = 1
    in1 = 0; in2 = 1; control = 0;
    #10;
    if (out !== 0) begin
      $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);
      $finish;
    end

    // Test case 6: control = 1, in1 = 1, in2 = 1
    in1 = 1; in2 = 1; control = 1;
    #10;
    if (out !== 1) begin
      $display("FAIL: Test case 6 failed, expected out = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule