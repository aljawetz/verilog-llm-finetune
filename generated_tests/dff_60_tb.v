`timescale 1ns/1ps

module tb_dff;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .d(d),
    .clk(clk),
    .rst(rst),
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
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    rst = 0; #10; // Deassert reset

    // Test 2: Set d to 1 and clock
    d = 1; #10; // Wait for clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to 1");
      $finish;
    end

    // Test 3: Set d to 0 and clock
    d = 0; #10; // Wait for clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to 0");
      $finish;
    end

    // Test 4: Assert reset again
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 5: Check behavior after reset
    rst = 0; #10; // Deassert reset
    d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to 1 after reset");
      $finish;
    end

    // Test 6: Final check
    d = 0; #10; // Set d to 0
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule