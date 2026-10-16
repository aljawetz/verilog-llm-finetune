`timescale 1ns/1ps

module tb_pulse_detect;

  reg clk;
  reg rst_n;
  reg data_in;
  wire data_out;

  // Instantiate the module under test (uut)
  pulse_detect uut (
    .clk(clk),
    .rst_n(rst_n),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    data_in = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test case 1: Detect a pulse
    // Input: 1 -> 0 -> 1
    #10 data_in = 1; // Rising edge
    #10 data_in = 0; // Falling edge
    #10 data_in = 1; // Rising edge
    #10;

    // Check output
    if (data_out !== 1'b1) begin
      $display("FAIL: Expected data_out to be 1 after pulse detection");
      $finish;
    end

    // Reset the module
    #10 rst_n = 0;
    #10 rst_n = 1;

    // Test case 2: No pulse detected
    // Input: 0 -> 0 -> 0
    #10 data_in = 0; // Remain low
    #10 data_in = 0; // Remain low
    #10;

    // Check output
    if (data_out !== 1'b0) begin
      $display("FAIL: Expected data_out to be 0 when no pulse is present");
      $finish;
    end

    // Test case 3: Incomplete pulse
    // Input: 1 -> 0 -> 0
    #10 data_in = 1; // Rising edge
    #10 data_in = 0; // Falling edge
    #10 data_in = 0; // Remain low
    #10;

    // Check output
    if (data_out !== 1'b0) begin
      $display("FAIL: Expected data_out to be 0 for incomplete pulse");
      $finish;
    end

    // Test case 4: Another complete pulse
    // Input: 1 -> 0 -> 1
    #10 data_in = 1; // Rising edge
    #10 data_in = 0; // Falling edge
    #10 data_in = 1; // Rising edge
    #10;

    // Check output
    if (data_out !== 1'b1) begin
      $display("FAIL: Expected data_out to be 1 after second pulse detection");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule