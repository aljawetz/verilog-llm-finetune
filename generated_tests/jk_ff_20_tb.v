`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg clr;
  reg j;
  reg k;
  wire q;

  // Instantiate the module under test
  jk_ff uut (
    .clk(clk),
    .clr(clr),
    .j(j),
    .k(k),
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
    clr = 1; j = 0; k = 0;
    #10; // Wait for clock edge

    // Test 1: Asynchronous clear
    clr = 0; // Clear the flip-flop
    #10;
    if (q !== 0) begin
      $display("FAIL: Asynchronous clear failed");
      $finish;
    end

    // Test 2: Set condition
    clr = 1; j = 1; k = 0; // Set
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: Set condition failed");
      $finish;
    end

    // Test 3: Reset condition
    j = 0; k = 1; // Reset
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Reset condition failed");
      $finish;
    end

    // Test 4: Toggle condition
    j = 1; k = 1; // Toggle
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: First toggle failed");
      $finish;
    end

    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Second toggle failed");
      $finish;
    end

    // Test 5: Hold condition
    j = 0; k = 0; // Hold
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Hold condition failed");
      $finish;
    end

    // Final check
    clr = 0; // Clear
    #10;
    if (q !== 0) begin
      $display("FAIL: Final clear failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule