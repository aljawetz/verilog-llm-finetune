`timescale 1ns/1ps

module tb_counter_12;

  reg rst_n;
  reg clk;
  reg valid_count;
  wire [3:0] out;

  // Instantiate the counter_12 module
  counter_12 uut (
    .rst_n(rst_n),
    .clk(clk),
    .valid_count(valid_count),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    valid_count = 0;
    
    // Apply reset
    #10;
    rst_n = 1; // Release reset
    #10;

    // Test counting
    valid_count = 1; // Enable counting
    #10; // Expect out = 1
    if (out !== 4'd1) $display("FAIL: Expected out = 1, got out = %d", out);

    #10; // Expect out = 2
    if (out !== 4'd2) $display("FAIL: Expected out = 2, got out = %d", out);

    #10; // Expect out = 3
    if (out !== 4'd3) $display("FAIL: Expected out = 3, got out = %d", out);

    // Continue counting up to 11
    #10; // Expect out = 4
    if (out !== 4'd4) $display("FAIL: Expected out = 4, got out = %d", out);

    #10; // Expect out = 5
    if (out !== 4'd5) $display("FAIL: Expected out = 5, got out = %d", out);

    #10; // Expect out = 6
    if (out !== 4'd6) $display("FAIL: Expected out = 6, got out = %d", out);

    #10; // Expect out = 7
    if (out !== 4'd7) $display("FAIL: Expected out = 7, got out = %d", out);

    #10; // Expect out = 8
    if (out !== 4'd8) $display("FAIL: Expected out = 8, got out = %d", out);

    #10; // Expect out = 9
    if (out !== 4'd9) $display("FAIL: Expected out = 9, got out = %d", out);

    #10; // Expect out = 10
    if (out !== 4'd10) $display("FAIL: Expected out = 10, got out = %d", out);

    #10; // Expect out = 11
    if (out !== 4'd11) $display("FAIL: Expected out = 11, got out = %d", out);

    #10; // Expect out = 0 after wrap
    if (out !== 4'd0) $display("FAIL: Expected out = 0 after wrap, got out = %d", out);

    // Test reset functionality
    rst_n = 0; // Assert reset
    #10;
    if (out !== 4'd0) $display("FAIL: Expected out = 0 after reset, got out = %d", out);

    rst_n = 1; // Release reset
    #10;

    // Test counting again
    valid_count = 1; // Enable counting
    #10; // Expect out = 1
    if (out !== 4'd1) $display("FAIL: Expected out = 1, got out = %d", out);

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule