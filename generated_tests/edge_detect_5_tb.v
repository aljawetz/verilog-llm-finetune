`timescale 1ns/1ps

module tb_edge_detect;

  reg clk;
  reg rst_n;
  reg a;
  wire rise;
  wire down;

  // Instantiate the module under test (uut)
  edge_detect uut (
    .clk(clk),
    .rst_n(rst_n),
    .a(a),
    .rise(rise),
    .down(down)
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
    a = 0;
    #10; // Wait for some time

    // Release reset
    rst_n = 1;
    #10;

    // Test rising edge detection
    a = 1; // a goes high
    #10;
    if (rise !== 1 || down !== 0) begin
      $display("FAIL: Rising edge not detected correctly");
      $finish;
    end

    // Clear rise signal
    #10;
    if (rise !== 0 || down !== 0) begin
      $display("FAIL: Rise signal not cleared correctly");
      $finish;
    end

    // Test falling edge detection
    a = 0; // a goes low
    #10;
    if (rise !== 0 || down !== 1) begin
      $display("FAIL: Falling edge not detected correctly");
      $finish;
    end

    // Clear down signal
    #10;
    if (rise !== 0 || down !== 0) begin
      $display("FAIL: Down signal not cleared correctly");
      $finish;
    end

    // Test no edge condition
    a = 0; // a remains low
    #10;
    if (rise !== 0 || down !== 0) begin
      $display("FAIL: No edge condition not detected correctly");
      $finish;
    end

    // Test another rising edge
    a = 1; // a goes high
    #10;
    if (rise !== 1 || down !== 0) begin
      $display("FAIL: Second rising edge not detected correctly");
      $finish;
    end

    // Clear rise signal again
    #10;
    if (rise !== 0 || down !== 0) begin
      $display("FAIL: Rise signal not cleared correctly after second edge");
      $finish;
    end

    // Test another falling edge
    a = 0; // a goes low
    #10;
    if (rise !== 0 || down !== 1) begin
      $display("FAIL: Second falling edge not detected correctly");
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule