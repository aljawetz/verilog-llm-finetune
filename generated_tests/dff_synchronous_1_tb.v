`timescale 1ns/1ps

module tb_dff_synchronous;

  reg clk;
  reg rst;
  reg d_in;
  wire q_out;

  // Instantiate the module under test (uut)
  dff_synchronous uut (
    .q_out(q_out),
    .clk(clk),
    .rst(rst),
    .d_in(d_in)
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
    d_in = 0;

    // Wait for a clock edge
    #10;

    // Test 1: Check reset functionality
    rst = 0; // Assert reset
    #10;
    if (q_out !== 0) begin
      $display("FAIL: Reset did not set q_out to 0");
      $finish;
    end

    // Test 2: Check D input functionality
    rst = 1; // Deassert reset
    d_in = 1; // Set D input to 1
    #10; // Wait for clock edge
    if (q_out !== 1) begin
      $display("FAIL: q_out did not update to d_in (expected 1)");
      $finish;
    end

    // Test 3: Change D input
    d_in = 0; // Change D input to 0
    #10; // Wait for clock edge
    if (q_out !== 0) begin
      $display("FAIL: q_out did not update to d_in (expected 0)");
      $finish;
    end

    // Test 4: Check reset again
    rst = 0; // Assert reset
    #10;
    if (q_out !== 0) begin
      $display("FAIL: Reset did not set q_out to 0");
      $finish;
    end

    // Test 5: Assert reset and check D input
    rst = 1; // Deassert reset
    d_in = 1; // Set D input to 1
    #10; // Wait for clock edge
    if (q_out !== 1) begin
      $display("FAIL: q_out did not update to d_in (expected 1)");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule