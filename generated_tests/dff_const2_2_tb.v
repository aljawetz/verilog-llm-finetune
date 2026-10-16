`timescale 1ns/1ps

module tb_dff_const2;

  reg clk;
  reg set;
  wire q;

  // Instantiate the module under test (uut)
  dff_const2 uut (
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

    // Check if output q is always 1'b1
    if (q !== 1'b1) begin
      $display("FAIL: Output q is not 1'b1 at time %0t", $time);
      $finish;
    end

    // Change set input
    set = 1;
    #10;

    // Check if output q is still 1'b1
    if (q !== 1'b1) begin
      $display("FAIL: Output q is not 1'b1 after set change at time %0t", $time);
      $finish;
    end

    // Wait for more clock cycles
    #10;

    // Check if output q is still 1'b1
    if (q !== 1'b1) begin
      $display("FAIL: Output q is not 1'b1 after additional wait at time %0t", $time);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule