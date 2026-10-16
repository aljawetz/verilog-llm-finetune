`timescale 1ns/1ps

module tb_posedgeclk_noreset_dff;

  reg clk;
  reg d;
  wire q;

  // Instantiate the module under test (uut)
  posedgeclk_noreset_dff uut (
    .clk(clk),
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
    // Initialize inputs
    d = 0;

    // Wait for the first clock edge
    #10;
    if (q !== 0) begin
      $display("FAIL: Output q should be 0 after first clock edge");
      $finish;
    end

    // Apply test vector
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 after second clock edge");
      $finish;
    end

    // Change input
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: Output q should be 0 after third clock edge");
      $finish;
    end

    // Change input again
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 after fourth clock edge");
      $finish;
    end

    // Final check
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: Output q should be 0 after fifth clock edge");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule