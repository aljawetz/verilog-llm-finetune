`timescale 1ns/1ps

module tb_dff;
  reg reset;
  reg clk;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .q(q),
    .reset(reset),
    .clk(clk),
    .d(d)
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
    d = 0;
    #10; // Wait for 10ns

    // Test 1: Check reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not initialize q to 0");
      $finish;
    end

    // Release reset
    reset = 0;
    #10; // Wait for 10ns

    // Test 2: Check D input propagation
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // Test 3: Check reset functionality again
    reset = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Test 4: Check D input propagation after reset
    reset = 0;
    d = 0;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d after reset");
      $finish;
    end

    // Test 5: Check D input propagation with different values
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // Final check: Reset again
    reset = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 on final check");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule