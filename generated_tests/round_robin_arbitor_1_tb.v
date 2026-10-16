`timescale 1ns/1ps

module tb_round_robin_arbitor;

  reg clk;
  reg reset;
  reg [3:0] r;
  wire [3:0] g;

  // Instantiate the unit under test (UUT)
  round_robin_arbitor uut (
    .clk(clk),
    .reset(reset),
    .r(r),
    .g(g)
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
    r = 4'b0000;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test case 1: Single request
    r = 4'b0001; // Request from source 0
    #10;
    if (g !== 4'b0001) $display("FAIL: Expected g = 4'b0001, got g = %b", g);

    // Test case 2: Rotate to next request
    r = 4'b0010; // Request from source 1
    #10;
    if (g !== 4'b0010) $display("FAIL: Expected g = 4'b0010, got g = %b", g);

    // Test case 3: Rotate to next request
    r = 4'b0100; // Request from source 2
    #10;
    if (g !== 4'b0100) $display("FAIL: Expected g = 4'b0100, got g = %b", g);

    // Test case 4: Rotate to next request
    r = 4'b1000; // Request from source 3
    #10;
    if (g !== 4'b1000) $display("FAIL: Expected g = 4'b1000, got g = %b", g);

    // Test case 5: Multiple requests
    r = 4'b1111; // Requests from all sources
    #10;
    if (g !== 4'b0001) $display("FAIL: Expected g = 4'b0001, got g = %b", g); // Should grant to 0 first

    // Test case 6: Reset functionality
    reset = 1;
    #10;
    reset = 0;
    r = 4'b0001; // Request from source 0 after reset
    #10;
    if (g !== 4'b0001) $display("FAIL: Expected g = 4'b0001 after reset, got g = %b", g);

    // Test case 7: No requests
    r = 4'b0000; // No requests
    #10;
    if (g !== 4'b0000) $display("FAIL: Expected g = 4'b0000 when no requests, got g = %b", g);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule