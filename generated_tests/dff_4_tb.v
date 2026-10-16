`timescale 1ns/1ps

module tb_dff;

  parameter gp_data_width = 8;

  // Testbench signals
  reg i_rst_an;
  reg i_ena;
  reg i_clk;
  reg [gp_data_width-1:0] i_data;
  wire [gp_data_width-1:0] o_data;

  // Instantiate the D flip-flop
  dff #(.gp_data_width(gp_data_width)) uut (
    .i_rst_an(i_rst_an),
    .i_ena(i_ena),
    .i_clk(i_clk),
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
    // Initialize signals
    i_rst_an = 1;
    i_ena = 0;
    i_data = 8'b00000000;

    // Test 1: Asynchronous reset
    i_rst_an = 0; // Assert reset
    #10;
    if (o_data !== 8'b00000000) begin
      $display("FAIL: Reset did not clear output");
      $finish;
    end

    i_rst_an = 1; // Deassert reset
    #10;

    // Test 2: Load data when enabled
    i_ena = 1;
    i_data = 8'b10101010; // New data
    #10;
    if (o_data !== 8'b10101010) begin
      $display("FAIL: Output did not match input data when enabled");
      $finish;
    end

    // Test 3: Check output holds when not enabled
    i_ena = 0;
    #10;
    if (o_data !== 8'b10101010) begin
      $display("FAIL: Output changed when not enabled");
      $finish;
    end

    // Test 4: Check reset works again
    i_rst_an = 0; // Assert reset
    #10;
    if (o_data !== 8'b00000000) begin
      $display("FAIL: Reset did not clear output again");
      $finish;
    end

    // Test 5: Load new data after reset
    i_rst_an = 1; // Deassert reset
    #10;
    i_ena = 1;
    i_data = 8'b11110000; // New data
    #10;
    if (o_data !== 8'b11110000) begin
      $display("FAIL: Output did not match new input data after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule