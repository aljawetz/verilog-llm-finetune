`timescale 1ns/1ps

module tb_day6;

  reg clk;
  reg reset;
  reg x_i;
  wire [3:0] sr_o;

  // Instantiate the module under test
  day6 uut (
    .clk(clk),
    .reset(reset),
    .x_i(x_i),
    .sr_o(sr_o)
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
    x_i = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test shifting with x_i = 1
    x_i = 1; #10; // sr_o should be 0001
    if (sr_o !== 4'b0001) begin
      $display("FAIL: Expected sr_o = 0001, got sr_o = %b", sr_o);
      $finish;
    end

    // Shift again with x_i = 0
    x_i = 0; #10; // sr_o should be 0010
    if (sr_o !== 4'b0010) begin
      $display("FAIL: Expected sr_o = 0010, got sr_o = %b", sr_o);
      $finish;
    end

    // Shift again with x_i = 1
    x_i = 1; #10; // sr_o should be 0101
    if (sr_o !== 4'b0101) begin
      $display("FAIL: Expected sr_o = 0101, got sr_o = %b", sr_o);
      $finish;
    end

    // Shift again with x_i = 0
    x_i = 0; #10; // sr_o should be 1010
    if (sr_o !== 4'b1010) begin
      $display("FAIL: Expected sr_o = 1010, got sr_o = %b", sr_o);
      $finish;
    end

    // Reset the shift register
    reset = 1; #10; // sr_o should be 0000
    reset = 0; #10;
    if (sr_o !== 4'b0000) begin
      $display("FAIL: Expected sr_o = 0000 after reset, got sr_o = %b", sr_o);
      $finish;
    end

    // Final check with x_i = 1
    x_i = 1; #10; // sr_o should be 0001
    if (sr_o !== 4'b0001) begin
      $display("FAIL: Expected sr_o = 0001 after reset, got sr_o = %b", sr_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule