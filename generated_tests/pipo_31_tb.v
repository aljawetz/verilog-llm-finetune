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
    clr = 0;

    // Test case 1: Check reset functionality
    clr = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (po !== 4'b0000) begin
      $display("FAIL: Reset did not set output to 0000");
      $finish;
    end

    // Test case 2: Check loading of input
    clr = 0; // Deassert clear
    pi = 4'b1010; // Load input
    #10; // Wait for one clock cycle
    if (po !== 4'b1010) begin
      $display("FAIL: Output did not match input 1010");
      $finish;
    end

    // Test case 3: Check that output holds value after input
    #10; // Wait for another clock cycle
    if (po !== 4'b1010) begin
      $display("FAIL: Output changed unexpectedly");
      $finish;
    end

    // Test case 4: Check reset functionality again
    clr = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (po !== 4'b0000) begin
      $display("FAIL: Reset did not set output to 0000");
      $finish;
    end

    // Test case 5: Load new input after reset
    clr = 0; // Deassert clear
    pi = 4'b1111; // Load new input
    #10; // Wait for one clock cycle
    if (po !== 4'b1111) begin
      $display("FAIL: Output did not match new input 1111");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule