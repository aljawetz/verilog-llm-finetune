`timescale 1ns/1ps

module tb_sirv_AsyncResetReg;

  reg d;
  reg en;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  sirv_AsyncResetReg uut (
    .d(d),
    .q(q),
    .en(en),
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
    // Initialize inputs
    d = 0;
    en = 0;
    rst = 0;

    // Test 1: Reset the register
    rst = 1; // Assert reset
    #10;     // Wait for one clock cycle
    rst = 0; // Deassert reset
    #10;     // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Enable and set d
    en = 1;
    d = 1; // Set d to 1
    #10;     // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d when enabled");
      $finish;
    end

    // Test 3: Change d while enabled
    d = 0; // Change d to 0
    #10;     // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to new d when enabled");
      $finish;
    end

    // Test 4: Disable the register
    en = 0;
    d = 1; // Change d to 1
    #10;     // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q should not update when disabled");
      $finish;
    end

    // Test 5: Re-enable and set d
    en = 1;
    d = 1; // Set d to 1 again
    #10;     // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d when re-enabled");
      $finish;
    end

    // Test 6: Assert reset again
    rst = 1; // Assert reset
    #10;     // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule