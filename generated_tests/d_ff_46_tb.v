`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg d;
  reg rst;
  wire q;

  // Instantiate the D flip-flop module
  d_ff uut (
    .clk(clk),
    .d(d),
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
    rst = 1; d = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test D flip-flop functionality
    d = 1; #10; // Set d to 1, wait for clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d (1)");
      $finish;
    end

    d = 0; #10; // Set d to 0, wait for clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d (0)");
      $finish;
    end

    // Test reset functionality again
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Release reset and test again
    rst = 0; d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d (1) after reset");
      $finish;
    end

    d = 0; #10; // Set d to 0
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d (0) after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule