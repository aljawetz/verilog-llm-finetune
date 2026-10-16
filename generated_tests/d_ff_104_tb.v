`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg din;
  reg clk;
  reg rst;

  // Outputs
  wire q;
  wire qb;

  // Instantiate the D flip-flop
  d_ff uut (
    .q(q),
    .qb(qb),
    .din(din),
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
    din = 0;
    rst = 1; // Assert reset

    // Wait for a clock edge
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Deassert reset
    rst = 0;
    #10;

    // Test with din = 1
    din = 1;
    #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting din to 1, q should be 1 and qb should be 0");
      $finish;
    end

    // Test with din = 0
    din = 0;
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: After setting din to 0, q should be 0 and qb should be 1");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1 on second reset");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end

endmodule