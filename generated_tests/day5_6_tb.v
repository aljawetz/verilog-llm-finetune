`timescale 1ns/1ps

module tb_day5;

  reg clk;
  reg reset;
  wire [7:0] cnt_o;

  // Instantiate the module under test
  day5 uut (
    .clk(clk),
    .reset(reset),
    .cnt_o(cnt_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    reset = 0; // Deassert reset

    // Check initial value after reset
    if (cnt_o !== 8'h1) begin
      $display("FAIL: Initial value after reset is not 1");
      $finish;
    end

    // Wait for a few clock cycles and check the counter value
    #10; // Wait for 1 clock cycle
    if (cnt_o !== 8'h3) begin
      $display("FAIL: Counter value is not 3 after 1 clock cycle");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (cnt_o !== 8'h5) begin
      $display("FAIL: Counter value is not 5 after 2 clock cycles");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (cnt_o !== 8'h7) begin
      $display("FAIL: Counter value is not 7 after 3 clock cycles");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (cnt_o !== 8'h9) begin
      $display("FAIL: Counter value is not 9 after 4 clock cycles");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (cnt_o !== 8'hB) begin
      $display("FAIL: Counter value is not B after 5 clock cycles");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule