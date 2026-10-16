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

    // Test rising edge detection
    a_i = 0; #10; // Stay low
    if (rising_edge_o !== 0) $display("FAIL: Rising edge detected incorrectly when a_i is low");
    
    a_i = 1; #10; // Transition to high
    if (rising_edge_o !== 1) $display("FAIL: Rising edge not detected when a_i transitions from 0 to 1");
    
    // Clear rising edge output
    #10;
    if (rising_edge_o !== 0) $display("FAIL: Rising edge output not cleared after detection");

    // Test falling edge detection
    a_i = 1; #10; // Stay high
    if (falling_edge_o !== 0) $display("FAIL: Falling edge detected incorrectly when a_i is high");
    
    a_i = 0; #10; // Transition to low
    if (falling_edge_o !== 1) $display("FAIL: Falling edge not detected when a_i transitions from 1 to 0");
    
    // Clear falling edge output
    #10;
    if (falling_edge_o !== 0) $display("FAIL: Falling edge output not cleared after detection");

    // Test no edge condition
    a_i = 0; #10; // Stay low
    if (rising_edge_o !== 0 || falling_edge_o !== 0) $display("FAIL: Outputs not cleared when a_i is stable");

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule