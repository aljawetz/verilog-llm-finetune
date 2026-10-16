`timescale 1ns/1ps

module tb_edge_detect;
  reg clk;
  reg rst_n;
  reg a;
  wire rise;
  wire down;

  // Instantiate the module under test
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
    #10;

    // Release reset
    rst_n = 1;
    #10;

    // Test rising edge detection
    a = 1; // Rising edge
    #10;
    if (rise !== 1'b1 || down !== 1'b0) begin
      $display("FAIL: Rising edge not detected correctly");
      $finish;
    end
    #10; // Wait for one clock cycle
    if (rise !== 1'b0 || down !== 1'b0) begin
      $display("FAIL: Rise signal not cleared after one clock cycle");
      $finish;
    end

    // Test falling edge detection
    a = 0; // Falling edge
    #10;
    if (rise !== 1'b0 || down !== 1'b1) begin
      $display("FAIL: Falling edge not detected correctly");
      $finish;
    end
    #10; // Wait for one clock cycle
    if (rise !== 1'b0 || down !== 1'b0) begin
      $display("FAIL: Down signal not cleared after one clock cycle");
      $finish;
    end

    // Test no edge condition
    a = 0; // No edge
    #10;
    if (rise !== 1'b0 || down !== 1'b0) begin
      $display("FAIL: No edge condition not detected correctly");
      $finish;
    end

    // Test rising edge again
    a = 1; // Rising edge
    #10;
    if (rise !== 1'b1 || down !== 1'b0) begin
      $display("FAIL: Rising edge not detected correctly on second occurrence");
      $finish;
    end
    #10; // Wait for one clock cycle
    if (rise !== 1'b0 || down !== 1'b0) begin
      $display("FAIL: Rise signal not cleared after one clock cycle on second occurrence");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule