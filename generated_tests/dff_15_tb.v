`timescale 1ns/1ps

module tb_dff;

  reg d;
  reg clk;
  reg reset;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
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
    reset = 0;

    // Test 1: Reset the flip-flop
    reset = 1; #10; // Hold reset high for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Set d to 1 and clock
    reset = 0; d = 1; #10; // Clock should capture d
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d when reset is low");
      $finish;
    end

    // Test 3: Set d to 0 and clock
    d = 0; #10; // Clock should capture d
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture d when reset is low");
      $finish;
    end

    // Test 4: Assert reset again
    reset = 1; #10; // Hold reset high for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 5: Check behavior after reset
    reset = 0; d = 1; #10; // Clock should capture d
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d after reset");
      $finish;
    end

    // Test 6: Final check with d = 0
    d = 0; #10; // Clock should capture d
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture d after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule