`timescale 1ns/1ps

module tb_dff_const4;
  reg clk;
  reg set;
  wire q;

  // Instantiate the module under test (uut)
  dff_const4 uut (
    .clk(clk),
    .set(set),
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
    set = 0;

    // Wait for a few clock cycles
    #10;

    // Check the output q
    if (q !== 1'b1) begin
      $display("FAIL: Output q is not constant high");
      $finish;
    end

    // Change set input
    set = 1;
    #10;

    // Check the output q again
    if (q !== 1'b1) begin
      $display("FAIL: Output q is not constant high after set change");
      $finish;
    end

    // Wait for more clock cycles
    #10;

    // Final check of output q
    if (q !== 1'b1) begin
      $display("FAIL: Output q is not constant high after additional time");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule