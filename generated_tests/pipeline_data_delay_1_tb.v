`timescale 1ns/1ps

module tb_pipeline_data_delay;

  parameter LATENCY = 2;
  parameter DW = 32;

  reg clk;
  reg rst_n;
  reg [DW-1:0] in_data;
  wire [DW-1:0] o_data;

  // Instantiate the module under test (uut)
  pipeline_data_delay #(LATENCY, DW) uut (
    .clk(clk),
    .rst_n(rst_n),
    .in_data(in_data),
    .o_data(o_data)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    rst_n = 0; // Assert reset
    in_data = 0;
    #10; // Wait for 10ns
    rst_n = 1; // Deassert reset

    // Test case 1: Check output after reset
    #10;
    if (o_data !== 0) begin
      $display("FAIL: Output should be 0 after reset");
      $finish;
    end

    // Test case 2: Apply input data
    in_data = 32'hA5A5A5A5; // Input some data
    #10; // Wait for one clock cycle

    // Check output after one clock cycle
    if (o_data !== 0) begin
      $display("FAIL: Output should still be 0 after one clock cycle with LATENCY=2");
      $finish;
    end

    // Test case 3: Check output after two clock cycles
    #10; // Wait for another clock cycle
    if (o_data !== in_data) begin
      $display("FAIL: Output should be %h after two clock cycles", in_data);
      $finish;
    end

    // Test case 4: Change input data
    in_data = 32'h5A5A5A5A; // Change input data
    #10; // Wait for one clock cycle

    // Check output after three clock cycles
    if (o_data !== 32'hA5A5A5A5) begin
      $display("FAIL: Output should be %h after three clock cycles", 32'hA5A5A5A5);
      $finish;
    end

    // Check output after four clock cycles
    #10; // Wait for another clock cycle
    if (o_data !== in_data) begin
      $display("FAIL: Output should be %h after four clock cycles", in_data);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule