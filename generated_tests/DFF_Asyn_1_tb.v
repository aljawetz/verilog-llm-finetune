`timescale 1ns/1ps

module tb_DFF_Asyn;

  reg D;
  reg clk;
  reg reset;
  wire Q;

  // Instantiate the DFF_Asyn module
  DFF_Asyn uut (
    .D(D),
    .clk(clk),
    .reset(reset),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    D = 0;
    reset = 0;

    // Test 1: Check reset functionality
    reset = 1; #10; // Assert reset
    if (Q !== 0) begin
      $display("FAIL: Reset did not clear Q to 0");
      $finish;
    end
    reset = 0; #10; // Deassert reset

    // Test 2: Check D input on clock edge
    D = 1; #10; // Wait for clock edge
    if (Q !== 1) begin
      $display("FAIL: Q did not update to D on clock edge");
      $finish;
    end

    // Test 3: Check D input with multiple clock edges
    D = 0; #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Q did not update to D on clock edge");
      $finish;
    end

    D = 1; #10; // Wait for clock edge
    if (Q !== 1) begin
      $display("FAIL: Q did not update to D on clock edge");
      $finish;
    end

    // Test 4: Check reset functionality again
    reset = 1; #10; // Assert reset
    if (Q !== 0) begin
      $display("FAIL: Reset did not clear Q to 0");
      $finish;
    end

    // Test 5: Check behavior after reset
    reset = 0; #10; // Deassert reset
    D = 0; #10; // Wait for clock edge
    if (Q !== 0) begin
      $display("FAIL: Q did not update to D on clock edge");
      $finish;
    end

    D = 1; #10; // Wait for clock edge
    if (Q !== 1) begin
      $display("FAIL: Q did not update to D on clock edge");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule