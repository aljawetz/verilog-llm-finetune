`timescale 1ns/1ps

module tb_d_ff;
  reg din;
  reg clk;
  reg rst;
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
    // Initialize signals
    rst = 1;
    din = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test case 1: Check reset behavior
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 2: Check D flip-flop behavior
    din = 1; // Set D input to 1
    #10; // Wait for one clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D flip-flop did not set q to 1 and qb to 0");
      $finish;
    end

    // Test case 3: Change D input to 0
    din = 0; // Set D input to 0
    #10; // Wait for one clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: D flip-flop did not set q to 0 and qb to 1 after D input changed");
      $finish;
    end

    // Test case 4: Assert reset again
    rst = 1; // Apply reset
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1 on reassertion");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule