`timescale 1ns/1ps

module tb_d_ff;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
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
      // Initialize inputs
      d = 0;
      rst = 0;

      // Test 1: Reset functionality
      rst = 1; // Assert reset
      #10; // Wait for one clock cycle
      if (q !== 1'b0) begin
          $display("FAIL: Reset did not set q to 0");
          $finish;
      end

      // Test 2: Capture d on rising edge of clk
      rst = 0; // Deassert reset
      d = 1; // Set d to 1
      #10; // Wait for one clock cycle
      if (q !== 1'b1) begin
          $display("FAIL: q did not capture d on rising edge");
          $finish;
      end

      // Test 3: Change d and check q
      d = 0; // Change d to 0
      #10; // Wait for one clock cycle
      if (q !== 1'b0) begin
          $display("FAIL: q did not capture new d value on rising edge");
          $finish;
      end

      // Test 4: Assert reset again
      rst = 1; // Assert reset
      #10; // Wait for one clock cycle
      if (q !== 1'b0) begin
          $display("FAIL: Reset did not set q to 0 again");
          $finish;
      end

      // Test 5: Check if q holds value after reset is deasserted
      rst = 0; // Deassert reset
      d = 1; // Set d to 1
      #10; // Wait for one clock cycle
      if (q !== 1'b1) begin
          $display("FAIL: q did not capture d after reset deasserted");
          $finish;
      end

      // If all tests pass
      $display("PASS");
      $finish;
  end

endmodule