`timescale 1ns/1ps

module tb_pipeline_ce_reset;

  parameter STAGES = 3; // Change this to test different configurations
  reg clk;
  reg ce;
  reg reset;
  reg i;
  wire o;

  // Instantiate the module under test
  pipeline_ce_reset #(.STAGES(STAGES)) uut (
    .clk(clk),
    .ce(ce),
    .reset(reset),
    .i(i),
    .o(o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    ce = 0;
    reset = 1;
    i = 0;

    // Wait for a few clock cycles
    #10;
    
    // Release reset
    reset = 0;
    #10;

    // Test with clock enable
    ce = 1;

    // Input 1, expect output to be 0 initially
    i = 1;
    #10;
    if (o !== 0) $display("FAIL: Expected output 0, got %b", o);

    // Shift input through the pipeline
    #10; // Clock 1
    if (o !== 1) $display("FAIL: Expected output 1, got %b", o);

    #10; // Clock 2
    i = 0; // Change input to 0
    if (o !== 1) $display("FAIL: Expected output 1, got %b", o);

    #10; // Clock 3
    if (o !== 0) $display("FAIL: Expected output 0, got %b", o);

    #10; // Clock 4
    if (o !== 0) $display("FAIL: Expected output 0, got %b", o);

    // Test reset functionality
    reset = 1;
    #10; // Clock 5
    reset = 0; // Release reset
    #10; // Clock 6
    if (o !== 0) $display("FAIL: Expected output 0 after reset, got %b", o);

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule