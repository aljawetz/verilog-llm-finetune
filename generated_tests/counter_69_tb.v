`timescale 1ns/1ps

module tb_counter;

  reg clk;
  reg reset;
  wire [7:0] out;

  // Instantiate the counter module
  counter uut (
    .out(out),
    .clk(clk),
    .reset(reset)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial value
    if (out !== 8'b00000000) begin
      $display("FAIL: Initial output is not zero");
      $finish;
    end

    // Wait for a few clock cycles and check output
    #10; // Wait for 1 clock cycle
    if (out !== 8'b00000001) begin
      $display("FAIL: Output after 1 clock cycle is not 1");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 8'b00000010) begin
      $display("FAIL: Output after 2 clock cycles is not 2");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 8'b00000011) begin
      $display("FAIL: Output after 3 clock cycles is not 3");
      $finish;
    end

    // Assert reset functionality
    reset = 1;
    #10; // Wait for reset to take effect
    if (out !== 8'b00000000) begin
      $display("FAIL: Output after reset is not zero");
      $finish;
    end

    // Check counter after reset
    reset = 0;
    #10; // Wait for 1 clock cycle
    if (out !== 8'b00000001) begin
      $display("FAIL: Output after reset and 1 clock cycle is not 1");
      $finish;
    end

    // Continue checking a few more cycles
    #10; // Wait for 1 clock cycle
    if (out !== 8'b00000010) begin
      $display("FAIL: Output after 2 clock cycles is not 2");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 8'b00000011) begin
      $display("FAIL: Output after 3 clock cycles is not 3");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule