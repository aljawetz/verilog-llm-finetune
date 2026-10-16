`timescale 1ns/1ps

module tb_more_ovr;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  more_ovr uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_n = 0;
    x = 0;
    
    // Apply reset
    #10;
    rst_n = 1; // Release reset

    // Test sequence
    // State transitions
    #10; x = 0; // S0 -> S1
    #10; x = 0; // S1 -> S1
    #10; x = 1; // S1 -> S2
    #10; x = 0; // S2 -> S1
    #10; x = 1; // S1 -> S2
    #10; x = 1; // S2 -> S3
    #10; x = 0; // S3 -> S4
    #10; // Check if z is high
    if (z !== 1) begin
      $display("FAIL: z should be high when in state S4");
      $finish;
    end

    #10; x = 1; // S4 -> S2
    #10; x = 0; // S2 -> S1
    #10; x = 0; // S1 -> S1
    #10; x = 1; // S1 -> S2
    #10; x = 1; // S2 -> S3
    #10; x = 0; // S3 -> S4
    #10; // Check if z is high
    if (z !== 1) begin
      $display("FAIL: z should be high when in state S4");
      $finish;
    end

    // Test reset functionality
    #10; rst_n = 0; // Assert reset
    #10; rst_n = 1; // Release reset
    #10; // Check if z is low after reset
    if (z !== 0) begin
      $display("FAIL: z should be low after reset");
      $finish;
    end

    // Final check
    #10; x = 1; // S0 -> S0
    #10; // Check if z is low
    if (z !== 0) begin
      $display("FAIL: z should be low when in state S0");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule