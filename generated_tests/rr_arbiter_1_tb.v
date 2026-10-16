`timescale 1ns/1ps

module tb_rr_arbiter;

  // Parameters
  reg clk;
  reg reset;
  reg req0, req1, req2, req3;
  wire gnt0, gnt1, gnt2, gnt3;

  // Instantiate the Unit Under Test (UUT)
  rr_arbiter uut (
    .clk(clk),
    .reset(reset),
    .req0(req0),
    .req1(req1),
    .req2(req2),
    .req3(req3),
    .gnt0(gnt0),
    .gnt1(gnt1),
    .gnt2(gnt2),
    .gnt3(gnt3)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    req0 = 0; req1 = 0; req2 = 0; req3 = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test case 1: Single request
    req0 = 1; #10;
    if (gnt0 !== 1 || gnt1 !== 0 || gnt2 !== 0 || gnt3 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Rotate to req1
    req0 = 0; req1 = 1; #10;
    if (gnt0 !== 0 || gnt1 !== 1 || gnt2 !== 0 || gnt3 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Rotate to req2
    req1 = 0; req2 = 1; #10;
    if (gnt0 !== 0 || gnt1 !== 0 || gnt2 !== 1 || gnt3 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Rotate to req3
    req2 = 0; req3 = 1; #10;
    if (gnt0 !== 0 || gnt1 !== 0 || gnt2 !== 0 || gnt3 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Multiple requests
    req0 = 1; req1 = 1; #10;
    if (gnt0 !== 1 || gnt1 !== 0 || gnt2 !== 0 || gnt3 !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: All requests
    req0 = 1; req1 = 1; req2 = 1; req3 = 1; #40; // Allow time for rotation
    if (gnt0 !== 1 || gnt1 !== 0 || gnt2 !== 0 || gnt3 !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end
    #10;
    if (gnt0 !== 0 || gnt1 !== 1 || gnt2 !== 0 || gnt3 !== 0) begin
      $display("FAIL: Test case 6 failed on second grant");
      $finish;
    end
    #10;
    if (gnt0 !== 0 || gnt1 !== 0 || gnt2 !== 1 || gnt3 !== 0) begin
      $display("FAIL: Test case 6 failed on third grant");
      $finish;
    end
    #10;
    if (gnt0 !== 0 || gnt1 !== 0 || gnt2 !== 0 || gnt3 !== 1) begin
      $display("FAIL: Test case 6 failed on fourth grant");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule