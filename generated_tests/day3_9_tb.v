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
    #10; // Wait for a few clock cycles
    reset = 0;

    // Test case 1: No edges
    #10;
    if (rising_edge_o !== 0 || falling_edge_o !== 0) begin
      $display("FAIL: No edges detected when a_i is stable at 0");
      $finish;
    end

    // Test case 2: Rising edge
    a_i = 1; // a_i goes from 0 to 1
    #10;
    if (rising_edge_o !== 1 || falling_edge_o !== 0) begin
      $display("FAIL: Rising edge not detected correctly");
      $finish;
    end

    // Clear the rising edge signal
    #10;
    if (rising_edge_o !== 0 || falling_edge_o !== 0) begin
      $display("FAIL: Rising edge signal not cleared after detection");
      $finish;
    end

    // Test case 3: Falling edge
    a_i = 0; // a_i goes from 1 to 0
    #10;
    if (rising_edge_o !== 0 || falling_edge_o !== 1) begin
      $display("FAIL: Falling edge not detected correctly");
      $finish;
    end

    // Clear the falling edge signal
    #10;
    if (rising_edge_o !== 0 || falling_edge_o !== 0) begin
      $display("FAIL: Falling edge signal not cleared after detection");
      $finish;
    end

    // Test case 4: No edges again
    #10;
    if (rising_edge_o !== 0 || falling_edge_o !== 0) begin
      $display("FAIL: No edges detected when a_i is stable at 0");
      $finish;
    end

    // Test case 5: Multiple edges
    a_i = 1; // a_i goes from 0 to 1
    #10;
    if (rising_edge_o !== 1 || falling_edge_o !== 0) begin
      $display("FAIL: Rising edge not detected correctly on multiple edges");
      $finish;
    end

    a_i = 0; // a_i goes from 1 to 0
    #10;
    if (rising_edge_o !== 0 || falling_edge_o !== 1) begin
      $display("FAIL: Falling edge not detected correctly on multiple edges");
      $finish;
    end

    // Final check
    #10;
    if (rising_edge_o !== 0 || falling_edge_o !== 0) begin
      $display("FAIL: Final edge signals not cleared");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule