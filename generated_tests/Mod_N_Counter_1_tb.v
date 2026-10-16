`timescale 1ns/1ps

module tb_Mod_N_Counter;

  reg clk;
  reg reset;
  wire [5:0] count;

  // Instantiate the module under test (uut)
  Mod_N_Counter #(.N(6)) uut (
    .clk(clk),
    .reset(reset),
    .count(count)
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
    reset = 0;

    // Check initial count value
    if (count !== 0) begin
      $display("FAIL: Initial count is not zero");
      $finish;
    end

    // Wait for a few clock cycles and check count
    #10; // Wait for 1 clock cycle
    if (count !== 1) begin
      $display("FAIL: Count after 1 clock cycle is not 1");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 2) begin
      $display("FAIL: Count after 2 clock cycles is not 2");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 3) begin
      $display("FAIL: Count after 3 clock cycles is not 3");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 4) begin
      $display("FAIL: Count after 4 clock cycles is not 4");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 5) begin
      $display("FAIL: Count after 5 clock cycles is not 5");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 0) begin
      $display("FAIL: Count after 6 clock cycles is not 0 (reset)");
      $finish;
    end

    // Assert reset and check count
    reset = 1;
    #10; // Wait for 1 clock cycle
    reset = 0;

    // Check count is back to zero after reset
    if (count !== 0) begin
      $display("FAIL: Count after reset is not zero");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule