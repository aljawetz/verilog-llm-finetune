`timescale 1ns/1ps

module tb_day13;

  reg clk;
  reg reset;
  reg [3:0] parallel_in;
  wire serial_o;
  wire empty_o;
  wire valid_o;

  // Instantiate the module under test (uut)
  day13 uut (
    .clk(clk),
    .reset(reset),
    .parallel_in(parallel_in),
    .serial_o(serial_o),
    .empty_o(empty_o),
    .valid_o(valid_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    parallel_in = 4'b0000;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test case 1: Load parallel input when empty
    parallel_in = 4'b1010; // Load 1010
    #10; // Wait for a clock cycle
    if (empty_o !== 1) $display("FAIL: Expected empty_o to be 1 after loading parallel input");
    
    // Test case 2: Shift out bits serially
    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1 (MSB of 1010)");

    #10; // Wait for a clock cycle
    if (serial_o !== 0) $display("FAIL: Expected serial_o to be 0 (next bit of 1010)");

    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1 (next bit of 1010)");

    #10; // Wait for a clock cycle
    if (serial_o !== 0) $display("FAIL: Expected serial_o to be 0 (last bit of 1010)");

    // Test case 3: Check empty and valid signals
    #10; // Wait for a clock cycle
    if (empty_o !== 1) $display("FAIL: Expected empty_o to be 1 after all bits shifted out");
    if (valid_o !== 0) $display("FAIL: Expected valid_o to be 0 after all bits shifted out");

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule