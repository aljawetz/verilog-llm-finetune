`timescale 1ns/1ps

module tb_tff;
  reg t;
  reg clk;
  wire q;

  // Instantiate the T flip-flop
  tff uut (
    .t(t),
    .clk(clk),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    t = 0;
    #10; // Wait for 10ns

    // Check initial state
    if (q !== 1) begin
      $display("FAIL: Initial state is not correct");
      $finish;
    end

    // Test toggling behavior
    t = 1; // Set T high
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to be 0 after toggle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to be 1 after toggle");
      $finish;
    end

    // Test holding state
    t = 0; // Set T low
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to remain 1 when T is low");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to remain 1 when T is low");
      $finish;
    end

    // Test toggling again
    t = 1; // Set T high
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q to be 0 after toggle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q to be 1 after toggle");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end
endmodule