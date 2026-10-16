`timescale 1ns/1ps

module tb_parallel_to_serial;

  reg clk;
  reg rst;
  reg [3:0] parallel_i;
  wire serial_o;
  wire empty_o;
  wire valid_o;

  // Instantiate the module under test (uut)
  parallel_to_serial uut (
    .clk(clk),
    .rst(rst),
    .serial_o(serial_o),
    .parallel_i(parallel_i),
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
    rst = 1;
    parallel_i = 4'b0000;
    #10; // Wait for a clock cycle
    rst = 0;

    // Test case 1: Load parallel data and check serial output
    parallel_i = 4'b1010; // Load 1010
    #10; // Wait for a clock cycle
    if (empty_o !== 0) $display("FAIL: Expected empty_o to be 0 after loading data");
    if (valid_o !== 1) $display("FAIL: Expected valid_o to be 1 after loading data");

    // Shift out data
    #10; // Wait for a clock cycle
    if (serial_o !== 0) $display("FAIL: Expected serial_o to be 0");
    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1");
    #10; // Wait for a clock cycle
    if (serial_o !== 0) $display("FAIL: Expected serial_o to be 0");
    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1");
    
    // Check empty and valid signals
    #10; // Wait for a clock cycle
    if (empty_o !== 1) $display("FAIL: Expected empty_o to be 1 after all bits shifted out");
    if (valid_o !== 0) $display("FAIL: Expected valid_o to be 0 after all bits shifted out");

    // Test case 2: Load new data
    parallel_i = 4'b1111; // Load 1111
    #10; // Wait for a clock cycle
    if (empty_o !== 0) $display("FAIL: Expected empty_o to be 0 after loading new data");
    if (valid_o !== 1) $display("FAIL: Expected valid_o to be 1 after loading new data");

    // Shift out new data
    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1");
    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1");
    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1");
    #10; // Wait for a clock cycle
    if (serial_o !== 1) $display("FAIL: Expected serial_o to be 1");

    // Final check for empty and valid
    #10; // Wait for a clock cycle
    if (empty_o !== 1) $display("FAIL: Expected empty_o to be 1 after all bits shifted out");
    if (valid_o !== 0) $display("FAIL: Expected valid_o to be 0 after all bits shifted out");

    // If all assertions pass
    $display("PASS");
    $finish;
  end

endmodule