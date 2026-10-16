`timescale 1ns/1ps

module tb_pipo;

  reg [3:0] pi;
  reg clk;
  reg clr;
  wire [3:0] po;

  // Instantiate the module under test (uut)
  pipo uut (
    .pi(pi),
    .clk(clk),
    .clr(clr),
    .po(po)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    pi = 4'b0000;
    clr = 1;
    
    // Wait for a clock cycle
    #10;
    
    // Check reset functionality
    if (po !== 4'b0000) begin
      $display("FAIL: Reset did not set po to 0");
      $finish;
    end
    
    // Release reset
    clr = 0;
    #10;

    // Apply test vector
    pi = 4'b1010;
    #10;
    
    // Check output after applying input
    if (po !== 4'b1010) begin
      $display("FAIL: Output po did not match input pi");
      $finish;
    end

    // Apply another test vector
    pi = 4'b1100;
    #10;

    // Check output again
    if (po !== 4'b1100) begin
      $display("FAIL: Output po did not match input pi");
      $finish;
    end

    // Test the clear functionality again
    clr = 1;
    #10;

    // Check if output is cleared
    if (po !== 4'b0000) begin
      $display("FAIL: Clear did not set po to 0");
      $finish;
    end

    // End the test
    $display("PASS");
    $finish;
  end

endmodule