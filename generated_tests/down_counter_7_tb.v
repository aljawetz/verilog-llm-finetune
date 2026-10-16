`timescale 1ns/1ps

module tb_down_counter;
  reg clk;
  reg reset;
  wire [3:0] counter;

  // Instantiate the down_counter module
  down_counter uut (
    .clk(clk),
    .reset(reset),
    .counter(counter)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check initial counter value after reset
    if (counter !== 4'hf) begin
      $display("FAIL: Counter did not initialize to 15 on reset");
      $finish;
    end

    // Wait for a few clock cycles and check counter value remains unchanged
    #20; // Wait for 20ns (2 clock cycles)
    if (counter !== 4'hf) begin
      $display("FAIL: Counter changed after clock cycles");
      $finish;
    end

    // Further wait to ensure stability
    #30; // Wait for 30ns (3 clock cycles)
    if (counter !== 4'hf) begin
      $display("FAIL: Counter changed after additional clock cycles");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule