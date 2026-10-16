`timescale 1ns/1ps

module tb_Moore_101;

  reg clk;
  reg rst;
  reg I;
  wire det;

  // Instantiate the module under test (uut)
  Moore_101 uut (
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
    // Initialize inputs
    rst = 1;
    I = 0;
    #10; // Wait for reset to take effect

    // Release reset
    rst = 0;
    #10;

    // Test sequence to check state transitions and output
    // S0 -> S1 (I=1)
    I = 1; #10;
    if (uut.state !== 2'b01) $display("FAIL: Expected state S1 after I=1 from S0"); 

    // S1 -> S2 (I=0)
    I = 0; #10;
    if (uut.state !== 2'b10) $display("FAIL: Expected state S2 after I=0 from S1");

    // S2 -> S3 (I=1)
    I = 1; #10;
    if (uut.state !== 2'b11) $display("FAIL: Expected state S3 after I=1 from S2");

    // S3 -> S0 (I=0)
    I = 0; #10;
    if (uut.state !== 2'b00) $display("FAIL: Expected state S0 after I=0 from S3");

    // Check det output
    if (det !== 0) $display("FAIL: Expected det=0 when in state S0");
    
    // S0 -> S1 (I=1)
    I = 1; #10;
    if (det !== 0) $display("FAIL: Expected det=0 when in state S1");

    // S1 -> S2 (I=0)
    I = 0; #10;
    if (det !== 0) $display("FAIL: Expected det=0 when in state S2");

    // S2 -> S3 (I=1)
    I = 1; #10;
    if (det !== 1) $display("FAIL: Expected det=1 when in state S3");

    // S3 -> S0 (I=0)
    I = 0; #10;
    if (det !== 0) $display("FAIL: Expected det=0 when in state S0 after reset");

    // End of test
    $display("PASS");
    $finish;
  end

endmodule