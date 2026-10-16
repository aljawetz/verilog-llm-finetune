`timescale 1ns/1ps

module tb_elevator;
  reg clk;
  reg rst;
  reg ra, rb, rc, rd;
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
    ra = 0; rb = 0; rc = 0; rd = 0;
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test moving to floor B
    rb = 1; // Request to go to floor B
    #10;
    if (floor !== 2'b01) begin
      $display("FAIL: Expected floor B (01), got %b", floor);
      $finish;
    end
    rb = 0; // Clear request
    #10;

    // Test moving to floor C
    rc = 1; // Request to go to floor C
    #10;
    if (floor !== 2'b10) begin
      $display("FAIL: Expected floor C (10), got %b", floor);
      $finish;
    end
    rc = 0; // Clear request
    #10;

    // Test moving to floor D
    rd = 1; // Request to go to floor D
    #10;
    if (floor !== 2'b11) begin
      $display("FAIL: Expected floor D (11), got %b", floor);
      $finish;
    end
    rd = 0; // Clear request
    #10;

    // Test moving to floor A
    ra = 1; // Request to go to floor A
    #10;
    if (floor !== 2'b00) begin
      $display("FAIL: Expected floor A (00), got %b", floor);
      $finish;
    end
    ra = 0; // Clear request
    #10;

    // Final check to ensure no requests are active
    if (floor !== 2'b00) begin
      $display("FAIL: Expected floor A (00) with no requests, got %b", floor);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule