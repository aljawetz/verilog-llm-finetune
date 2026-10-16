`timescale 1ns/1ps

module tb_up_counter;

  reg clk;
  reg reset;
  wire [2:0] count;

  // Instantiate the module under test (uut)
  up_counter uut (
    .count(count),
    .clk(clk),
    .reset(reset)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1; // Start with reset active
    #10; // Wait for 10ns
    reset = 0; // Deactivate reset

    // Check initial count after reset
    if (count !== 3'b000) begin
      $display("FAIL: Initial count after reset is not zero");
      $finish;
    end

    // Wait for a few clock cycles and check count
    #10; // Wait for 1 clock cycle
    if (count !== 3'b001) begin
      $display("FAIL: Count after 1 clock cycle is not 1");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (count !== 3'b010) begin
      $display("FAIL: Count after 2 clock cycles is not 2");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (count !== 3'b011) begin
      $display("FAIL: Count after 3 clock cycles is not 3");
      $finish;
    end

    #10; // Wait for 1 more clock cycle
    if (count !== 3'b100) begin
      $display("FAIL: Count after 4 clock cycles is not 4");
      $finish;
    end

    // Test reset functionality
    reset = 1; // Activate reset
    #10; // Wait for 1 clock cycle
    reset = 0; // Deactivate reset

    // Check count after reset
    if (count !== 3'b000) begin
      $display("FAIL: Count after reset is not zero");
      $finish;
    end

    // Continue counting
    #10; // Wait for 1 clock cycle
    if (count !== 3'b001) begin
      $display("FAIL: Count after reset and 1 clock cycle is not 1");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule