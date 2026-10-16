`timescale 1ns/1ps

module tb_clock_divider;

  reg clk_in;
  reg rst;
  wire clk_out;

  // Instantiate the clock_divider module
  clock_divider uut (
    .clk_in(clk_in),
    .rst(rst),
    .clk_out(clk_out)
  );

  // Generate clock signal
  always begin
    #5 clk_in = ~clk_in; // 10ns period
  end

  initial begin
    // Initialize signals
    clk_in = 0;
    rst = 0;

    // Apply reset
    rst = 1;
    #10;
    rst = 0;

    // Wait for a few clock cycles
    #100;

    // Check the output clock
    if (clk_out !== 1'b0) begin
      $display("FAIL: clk_out should be 0 after reset");
      $finish;
    end

    // Wait for 40ns (4 clock cycles)
    #40;

    // Check the output clock after some cycles
    if (clk_out !== 1'b1) begin
      $display("FAIL: clk_out should be 1 after 4 clock cycles");
      $finish;
    end

    // Wait for another 40ns (4 more clock cycles)
    #40;

    // Check the output clock again
    if (clk_out !== 1'b0) begin
      $display("FAIL: clk_out should be 0 after 8 clock cycles");
      $finish;
    end

    // Wait for another 40ns (4 more clock cycles)
    #40;

    // Check the output clock again
    if (clk_out !== 1'b1) begin
      $display("FAIL: clk_out should be 1 after 12 clock cycles");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule