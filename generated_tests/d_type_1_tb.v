`timescale 1ns/1ps

module tb_d_type;

  reg d;
  reg clk;
  reg rst;
  wire q;
  wire qn;

  // Instantiate the D-type flip-flop
  d_type uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qn(qn)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    d = 0;
    rst = 0;

    // Test 1: Check reset functionality
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0 || qn !== 1'b1) begin
      $display("FAIL: Reset did not set q to 0 and qn to 1");
      $finish;
    end

    // Deactivate reset
    rst = 0;
    #10; // Wait for one clock cycle

    // Test 2: Check D input functionality
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1 || qn !== 1'b0) begin
      $display("FAIL: D input did not set q to 1 and qn to 0");
      $finish;
    end

    // Test 3: Change D input
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0 || qn !== 1'b1) begin
      $display("FAIL: D input did not set q to 0 and qn to 1");
      $finish;
    end

    // Test 4: Check reset again
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0 || qn !== 1'b1) begin
      $display("FAIL: Reset did not set q to 0 and qn to 1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule