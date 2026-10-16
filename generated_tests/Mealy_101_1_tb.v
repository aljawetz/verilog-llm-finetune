`timescale 1ns/1ps

module tb_Mealy_101;

  reg clk;
  reg rst;
  reg I;
  wire det;

  // Instantiate the module under test
  Mealy_101 uut (
    .clk(clk),
    .rst(rst),
    .I(I),
    .det(det)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    I = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test sequence to detect "101"
    // Expected output: det should be 1 when "101" is detected
    I = 0; #10; // State S0
    if (det !== 0) $display("FAIL: Detected 1 in S0 when I=0");

    I = 1; #10; // State S1
    if (det !== 0) $display("FAIL: Detected 1 in S1 when I=1");

    I = 0; #10; // State S2
    if (det !== 0) $display("FAIL: Detected 1 in S2 when I=0");

    I = 1; #10; // Back to State S1
    if (det !== 0) $display("FAIL: Detected 1 in S1 when I=1");

    I = 0; #10; // State S2
    if (det !== 0) $display("FAIL: Detected 1 in S2 when I=0");

    I = 1; #10; // State S1
    if (det !== 0) $display("FAIL: Detected 1 in S1 when I=1");

    I = 0; #10; // State S2
    if (det !== 0) $display("FAIL: Detected 1 in S2 when I=0");

    I = 1; #10; // Detected "101", should be in State S2 and det should be 1
    if (det !== 1) $display("FAIL: Detected 0 in S2 when I=1 after '101'");

    // Reset and check again
    rst = 1; #10;
    rst = 0; I = 0; #10; // State S0
    if (det !== 0) $display("FAIL: Detected 1 in S0 after reset");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule