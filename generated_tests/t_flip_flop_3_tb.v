`timescale 1ns/1ps

module tb_t_flip_flop;

  reg t;
  reg clk;
  reg rst;
  wire q;
  wire qbar;

  // Instantiate the T flip-flop module
  t_flip_flop uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    t = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test case 1: Check reset functionality
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: q did not toggle to 0 on next clock cycle");
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: q toggled when t is low");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: q changed when t is low");
      $finish;
    end

    // Test case 4: Toggle again when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: q did not toggle to 1 when t is high again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule