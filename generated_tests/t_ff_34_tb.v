`timescale 1ns/1ps

module tb_t_ff;

  reg clk;
  reg rstn;
  reg t;
  wire q;
  wire q_bar;

  // Instantiate the module under test (uut)
  t_ff uut (
    .clk(clk),
    .rstn(rstn),
    .t(t),
    .q(q),
    .q_bar(q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rstn = 0;
    t = 0;

    // Apply reset
    #10;
    rstn = 1; // Release reset

    // Test case 1: Check reset functionality
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and q_bar to 1");
      $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1 || q_bar !== 0) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: q did not toggle back to 0 when t is high");
      $finish;
    end

    // Test case 3: Ensure q does not change when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: q changed when t is low");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: q changed when t is low");
      $finish;
    end

    // Test case 4: Check reset functionality again
    rstn = 0; // Assert reset
    #10;
    if (q !== 0 || q_bar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and q_bar to 1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule