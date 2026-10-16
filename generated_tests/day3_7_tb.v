`timescale 1ns/1ps

module tb_day3;

  reg clk;
  reg reset;
  reg a_i;
  wire rising_edge_o;
  wire falling_edge_o;

  // Instantiate the module under test (uut)
  day3 uut (
    .clk(clk),
    .reset(reset),
    .a_i(a_i),
    .rising_edge_o(rising_edge_o),
    .falling_edge_o(falling_edge_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    a_i = 0;
    #10; // Wait for reset to take effect

    reset = 0;
    #10;

    // Test rising edge detection
    a_i = 1; // Rising edge should be detected
    #10;
    if (rising_edge_o !== 1'b1) begin
      $display("FAIL: Rising edge not detected when a_i changed from 0 to 1");
      $finish;
    end
    #10;

    a_i = 0; // No rising edge now
    #10;
    if (rising_edge_o !== 1'b0) begin
      $display("FAIL: Rising edge still asserted when a_i is 0");
      $finish;
    end
    #10;

    // Test falling edge detection
    a_i = 1; // Set a_i to 1
    #10;
    a_i = 0; // Falling edge should be detected
    #10;
    if (falling_edge_o !== 1'b1) begin
      $display("FAIL: Falling edge not detected when a_i changed from 1 to 0");
      $finish;
    end
    #10;

    a_i = 1; // No falling edge now
    #10;
    if (falling_edge_o !== 1'b0) begin
      $display("FAIL: Falling edge still asserted when a_i is 1");
      $finish;
    end
    #10;

    // Test reset functionality
    reset = 1; // Assert reset
    #10;
    if (rising_edge_o !== 1'b0 || falling_edge_o !== 1'b0) begin
      $display("FAIL: Outputs not cleared on reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule