`timescale 1ns/1ps

module tb_elevator;
  reg clk;
  reg rst;
  reg ra;
  reg rb;
  reg rc;
  reg rd;
  wire [1:0] floor;

  // Instantiate the elevator module
  elevator uut (
    .clk(clk),
    .rst(rst),
    .ra(ra),
    .rb(rb),
    .rc(rc),
    .rd(rd),
    .floor(floor)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    ra = 0;
    rb = 0;
    rc = 0;
    rd = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: Request to go to B from A
    ra = 0; rb = 1; rc = 0; rd = 0; // Request B
    #10;
    if (floor !== 2'b01) begin
      $display("FAIL: Expected floor B (01), got %b", floor);
      $finish;
    end

    // Test case 2: Request to go to C from B
    ra = 0; rb = 0; rc = 1; rd = 0; // Request C
    #10;
    if (floor !== 2'b10) begin
      $display("FAIL: Expected floor C (10), got %b", floor);
      $finish;
    end

    // Test case 3: Request to go to D from C
    ra = 0; rb = 0; rc = 0; rd = 1; // Request D
    #10;
    if (floor !== 2'b11) begin
      $display("FAIL: Expected floor D (11), got %b", floor);
      $finish;
    end

    // Test case 4: Request to go back to A from D
    ra = 1; rb = 0; rc = 0; rd = 0; // Request A
    #10;
    if (floor !== 2'b00) begin
      $display("FAIL: Expected floor A (00), got %b", floor);
      $finish;
    end

    // Test case 5: Reset functionality
    rst = 1; // Assert reset
    #10;
    rst = 0; // Deassert reset
    #10;
    if (floor !== 2'b00) begin
      $display("FAIL: Expected floor A (00) after reset, got %b", floor);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule