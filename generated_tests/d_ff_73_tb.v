`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg din;
  reg clk;
  reg rst;

  // Outputs
  wire q;
  wire qb;

  // Instantiate the Unit Under Test (UUT)
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
    #10; // Wait for 10ns

    // Deassert reset
    rst = 0;
    #10; // Wait for 10ns

    // Test case 1: Check reset behavior
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test case 2: Set din to 1
    din = 1;
    #10; // Wait for 10ns
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting din to 1, q should be 1 and qb should be 0");
      $finish;
    end

    // Test case 3: Set din to 0
    din = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: After setting din to 0, q should be 0 and qb should be 1");
      $finish;
    end

    // Test case 4: Assert reset again
    rst = 1;
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1 again");
      $finish;
    end

    // Test case 5: Deassert reset and set din to 1
    rst = 0;
    din = 1;
    #10; // Wait for 10ns
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting din to 1 post-reset, q should be 1 and qb should be 0");
      $finish;
    end

    // Test case 6: Deassert din to 0
    din = 0;
    #10; // Wait for 10ns
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: After setting din to 0 post-reset, q should be 0 and qb should be 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule