`timescale 1ns/1ps

module tb_clock_Buffer;

  // Inputs
  reg clk_in;

  // Outputs
  wire clk_out;

  // Instantiate the Unit Under Test (UUT)
  clock_Buffer uut (
    .clk_in(clk_in),
    .clk_out(clk_out)
  );

  // Clock generation
  initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in; // 10ns period
  end

  // Test sequence
  initial begin
    // Wait for a few clock cycles
    #15;

    // Check if clk_out follows clk_in
    if (clk_out !== clk_in) begin
      $display("FAIL: clk_out does not match clk_in at time %0t", $time);
      $finish;
    end

    // Wait for a few more clock cycles
    #20;

    // Check again
    if (clk_out !== clk_in) begin
      $display("FAIL: clk_out does not match clk_in at time %0t", $time);
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule