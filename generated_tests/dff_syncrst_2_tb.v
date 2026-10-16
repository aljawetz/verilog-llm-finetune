`timescale 1ns/1ps

module tb_dff_syncrst;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_syncrst uut (
    .d(d),
    .q(q),
    .clk(clk),
    .rst(rst)
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
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not clear q to 0");
      $finish;
    end

    // Test 2: Check D flip-flop functionality
    rst = 0; // Deactivate reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to D value 1");
      $finish;
    end

    // Test 3: Change D value
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to D value 0");
      $finish;
    end

    // Test 4: Check reset again
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not clear q to 0 again");
      $finish;
    end

    // Test 5: Check D value after reset
    rst = 0; // Deactivate reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to D value 1 after reset");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule