`timescale 1ns/1ps

module tb_FlipFlop;

  parameter Bits = 1;
  reg clk;
  reg rst_a;
  reg [Bits - 1 : 0] d;
  wire [Bits - 1 : 0] q;

  // Instantiate the FlipFlop module
  FlipFlop #(Bits) uut (
    .clk(clk),
    .rst_a(rst_a),
    .d(d),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_a = 0;
    d = 0;

    // Apply reset
    #10;
    rst_a = 1; // Release reset
    #10;

    // Test case 1: Check reset functionality
    d = 8'b10101010; // Set data
    #10; // Wait for clock edge
    if (q !== d) begin
      $display("FAIL: Expected q = %b, got q = %b after reset", d, q);
      $finish;
    end

    // Test case 2: Check flip-flop behavior
    d = 8'b11110000; // Change data
    #10; // Wait for clock edge
    if (q !== d) begin
      $display("FAIL: Expected q = %b, got q = %b after data change", d, q);
      $finish;
    end

    // Test case 3: Check reset functionality again
    rst_a = 0; // Assert reset
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b after reset", q);
      $finish;
    end

    // Test case 4: Release reset and check data
    rst_a = 1; // Release reset
    d = 8'b00001111; // Set new data
    #10; // Wait for clock edge
    if (q !== d) begin
      $display("FAIL: Expected q = %b, got q = %b after data change", d, q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule