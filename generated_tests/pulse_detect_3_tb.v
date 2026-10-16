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

    // Reset the DUT
    #10;
    rst_n = 1; // Release reset
    #10;

    // Test case 1: Single pulse detection
    data_in = 1; // Start pulse
    #10;
    data_in = 1; // Continue pulse
    #10;
    data_in = 1; // Continue pulse
    #10;
    data_in = 0; // End pulse
    #10;

    // Check if data_out is asserted
    if (data_out !== 1'b1) begin
      $display("FAIL: data_out should be 1 after three high cycles followed by a falling edge.");
      $finish;
    end

    // Wait for a clock cycle
    #10;

    // Test case 2: Reset and check for no output
    rst_n = 0; // Assert reset
    #10;
    rst_n = 1; // Release reset
    #10;

    // Ensure data_out is low after reset
    if (data_out !== 1'b0) begin
      $display("FAIL: data_out should be 0 after reset.");
      $finish;
    end

    // Test case 3: No pulse
    data_in = 0; // No pulse
    #30;

    // Ensure data_out is still low
    if (data_out !== 1'b0) begin
      $display("FAIL: data_out should remain 0 with no input pulse.");
      $finish;
    end

    // Test case 4: Another pulse detection
    data_in = 1; // Start pulse
    #10;
    data_in = 1; // Continue pulse
    #10;
    data_in = 1; // Continue pulse
    #10;
    data_in = 0; // End pulse
    #10;

    // Check if data_out is asserted again
    if (data_out !== 1'b1) begin
      $display("FAIL: data_out should be 1 after second pulse detection.");
      $finish;
    end

    // Wait for a clock cycle
    #10;

    // Test case 5: Pulse followed by a reset
    rst_n = 0; // Assert reset
    #10;
    rst_n = 1; // Release reset
    #10;

    // Ensure data_out is low after reset
    if (data_out !== 1'b0) begin
      $display("FAIL: data_out should be 0 after reset.");
      $finish;
    end

    // Finalize the simulation
    $display("PASS");
    $finish;
  end

endmodule