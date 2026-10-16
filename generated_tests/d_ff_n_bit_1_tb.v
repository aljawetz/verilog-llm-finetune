`timescale 1ns/1ps

module tb_d_ff_n_bit;

  // Parameters
  parameter N = 8;

  // Inputs
  reg i_clk;
  reg i_rst_n;
  reg [N-1:0] i_data;

  // Outputs
  wire [N-1:0] o_data;

  // Instantiate the Unit Under Test (UUT)
  d_ff_n_bit #(N) uut (
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_data(i_data),
    .o_data(o_data)
  );

  // Clock generation
  initial begin
    i_clk = 0;
    forever #5 i_clk = ~i_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    i_rst_n = 0;
    i_data = 8'b00000000;

    // Wait for global reset
    #10;

    // Release reset
    i_rst_n = 1;

    // Test 1: Check reset functionality
    #10;
    if (o_data !== 8'b00000000) begin
      $display("FAIL: Reset did not clear output");
      $finish;
    end

    // Test 2: Check data capture on rising edge
    i_data = 8'b10101010;
    #10; // Wait for clock edge
    if (o_data !== 8'b10101010) begin
      $display("FAIL: Output did not match input data after clock edge");
      $finish;
    end

    // Test 3: Check data capture with different input
    i_data = 8'b11110000;
    #10; // Wait for clock edge
    if (o_data !== 8'b11110000) begin
      $display("FAIL: Output did not match new input data after clock edge");
      $finish;
    end

    // Test 4: Check reset functionality again
    i_rst_n = 0;
    #10; // Wait for reset
    if (o_data !== 8'b00000000) begin
      $display("FAIL: Reset did not clear output on second reset");
      $finish;
    end

    // Test 5: Check data capture after reset
    i_rst_n = 1;
    i_data = 8'b00001111;
    #10; // Wait for clock edge
    if (o_data !== 8'b00001111) begin
      $display("FAIL: Output did not match input data after clock edge post-reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule