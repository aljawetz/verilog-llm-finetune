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
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end
    rst = 0; #10; // Deassert reset

    // Test 2: Enable and set d
    en = 1;
    d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d when en is high");
      $finish;
    end

    // Test 3: Disable enable
    en = 0; #10; // Disable en
    d = 0; #10; // Change d to 0
    if (q !== 1'b1) begin
      $display("FAIL: q should not change when en is low");
      $finish;
    end

    // Test 4: Re-enable and set d to 0
    en = 1;
    d = 0; #10; // Set d to 0
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d when en is high");
      $finish;
    end

    // Test 5: Assert reset again
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule