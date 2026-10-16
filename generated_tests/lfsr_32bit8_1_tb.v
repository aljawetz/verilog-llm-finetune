`timescale 1ns/1ps

module tb_lfsr_32bit8;
  reg clk;
  reg rst;
  wire lout6;
  
  // Instantiate the module under test
  lfsr_32bit8 uut (
    .clk(clk),
    .rst(rst),
    .lout6(lout6)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for a clock cycle
    rst = 0;

    // Check initial state
    if (uut.out !== 32'h6E8D1235) begin
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Run for a few clock cycles and check output
    #10; // Wait for 1 clock cycle
    if (lout6 !== uut.out[31]) begin
      $display("FAIL: lout6 does not match expected value after 1 cycle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (lout6 !== uut.out[31]) begin
      $display("FAIL: lout6 does not match expected value after 2 cycles");
      $finish;
    end

    // Reset the LFSR
    rst = 1;
    #10; // Wait for a clock cycle
    rst = 0;

    // Check if it resets to the initial value
    if (uut.out !== 32'h6E8D1235) begin
      $display("FAIL: Reset did not set to initial state");
      $finish;
    end

    // Run for a few more clock cycles
    #10; // Wait for 1 clock cycle
    if (lout6 !== uut.out[31]) begin
      $display("FAIL: lout6 does not match expected value after reset cycle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (lout6 !== uut.out[31]) begin
      $display("FAIL: lout6 does not match expected value after reset cycle");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule