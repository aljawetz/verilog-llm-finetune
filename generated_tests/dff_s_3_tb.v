`timescale 1ns/1ps

module tb_dff_s;
  reg d, clk, rst, set;
  wire q;

  // Instantiate the D-type flip-flop
  dff_s uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst),
    .set(set)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    set = 0;
    d = 0;

    // Test 1: Reset functionality
    #10; // Wait for a clock edge
    rst = 0; // Apply reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not clear q to 0");
      $finish;
    end

    // Test 2: Set functionality
    rst = 1; // Release reset
    #10; // Wait for a clock edge
    set = 1; // Apply set
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Set did not set q to 1");
      $finish;
    end

    // Test 3: D input functionality
    set = 0; // Release set
    d = 1; // Set d to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when clk is high");
      $finish;
    end

    // Test 4: D input functionality with d = 0
    d = 0; // Set d to 0
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when clk is high");
      $finish;
    end

    // Test 5: Check behavior with reset during operation
    rst = 0; // Apply reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not clear q to 0 during operation");
      $finish;
    end

    // Test 6: Check behavior with set during operation
    rst = 1; // Release reset
    set = 1; // Apply set
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Set did not set q to 1 during operation");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule