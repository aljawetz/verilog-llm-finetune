`timescale 1ns/1ps

module tb_async_up_dn_counter;

  // Testbench signals
  reg clk;
  reg rst;
  reg up_dn;
  wire [3:0] count;

  // Instantiate the module under test (uut)
  async_up_dn_counter uut (
    .clk(clk),
    .rst(rst),
    .up_dn(up_dn),
    .count(count)
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
    up_dn = 0;

    // Apply reset
    #10;
    rst = 0; // Deassert reset
    #10;
    
    // Test counting up
    up_dn = 1; // Set to count up
    #10; // Count should be 1
    if (count !== 4'b0001) $display("FAIL: Expected count 1, got %b", count);
    
    #10; // Count should be 2
    if (count !== 4'b0010) $display("FAIL: Expected count 2, got %b", count);
    
    #10; // Count should be 3
    if (count !== 4'b0011) $display("FAIL: Expected count 3, got %b", count);
    
    #10; // Count should be 4
    if (count !== 4'b0100) $display("FAIL: Expected count 4, got %b", count);
    
    #10; // Count should be 5
    if (count !== 4'b0101) $display("FAIL: Expected count 5, got %b", count);
    
    // Test counting down
    up_dn = 0; // Set to count down
    #10; // Count should be 4
    if (count !== 4'b0100) $display("FAIL: Expected count 4, got %b", count);
    
    #10; // Count should be 3
    if (count !== 4'b0011) $display("FAIL: Expected count 3, got %b", count);
    
    #10; // Count should be 2
    if (count !== 4'b0010) $display("FAIL: Expected count 2, got %b", count);
    
    #10; // Count should be 1
    if (count !== 4'b0001) $display("FAIL: Expected count 1, got %b", count);
    
    #10; // Count should be 0
    if (count !== 4'b0000) $display("FAIL: Expected count 0, got %b", count);
    
    // Test reset functionality
    rst = 1; // Assert reset
    #10;
    rst = 0; // Deassert reset
    #10;
    if (count !== 4'b0000) $display("FAIL: Expected count 0 after reset, got %b", count);
    
    // End simulation
    $display("PASS");
    $finish;
  end

endmodule