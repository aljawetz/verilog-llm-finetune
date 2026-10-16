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

    // Release reset
    rst = 0;

    // Test case 1: Set din to 1
    din = 1;
    #10; // Wait for clock edge
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting din to 1, q should be 1 and qb should be 0");
      $finish;
    end

    // Test case 2: Set din to 0
    din = 0;
    #10; // Wait for clock edge
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: After setting din to 0, q should be 0 and qb should be 1");
      $finish;
    end

    // Test case 3: Assert reset again
    rst = 1;
    #10; // Wait for clock edge
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1 again");
      $finish;
    end

    // Test case 4: Release reset and set din to 1 again
    rst = 0;
    din = 1;
    #10; // Wait for clock edge
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: After setting din to 1 again, q should be 1 and qb should be 0");
      $finish;
    end

    // Test case 5: Set din to 0 again
    din = 0;
    #10; // Wait for clock edge
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: After setting din to 0 again, q should be 0 and qb should be 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule