`timescale 1ns/1ps

module tb_t_ff;
  reg t;
  reg clk;
  wire q;

  // Instantiate the T flip-flop
  t_ff uut (
    .t(t),
    .clk(clk),
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
    t = 0;

    // Wait for a clock edge
    #10;
    if (q !== 1) begin
      $display("FAIL: Initial state of q is not 1");
      $finish;
    end

    // Test case 1: Toggle when t is high
    t = 1; // Set t high
    #10;   // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not toggle to 0 when t is high");
      $finish;
    end

    #10;   // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    // Test case 2: Hold state when t is low
    t = 0; // Set t low
    #10;   // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q changed when t is low");
      $finish;
    end

    #10;   // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: q changed when t is low");
      $finish;
    end

    // Test case 3: Toggle again when t is high
    t = 1; // Set t high
    #10;   // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not toggle to 0 when t is high again");
      $finish;
    end

    #10;   // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not toggle to 1 when t is high again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule