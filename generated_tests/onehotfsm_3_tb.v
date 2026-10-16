`timescale 1ns/1ps

module tb_onehotfsm;
  reg clk;
  reg rst;
  wire [3:0] state;
  wire [1:0] op;

  // Instantiate the module under test (uut)
  onehotfsm uut (
    .clk(clk),
    .rst(rst),
    .state(state),
    .op(op)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Check initial state
    if (state !== 4'b0001) begin
      $display("FAIL: Initial state is not idle");
      $finish;
    end

    // Cycle through states
    #10; // Wait for one clock cycle
    if (state !== 4'b0010 || op !== 2'b00) begin
      $display("FAIL: State after 1st clock cycle is incorrect");
      $finish;
    end

    #10; // Wait for one clock cycle
    if (state !== 4'b0100 || op !== 2'b01) begin
      $display("FAIL: State after 2nd clock cycle is incorrect");
      $finish;
    end

    #10; // Wait for one clock cycle
    if (state !== 4'b1000 || op !== 2'b10) begin
      $display("FAIL: State after 3rd clock cycle is incorrect");
      $finish;
    end

    #10; // Wait for one clock cycle
    if (state !== 4'b0001 || op !== 2'b11) begin
      $display("FAIL: State after 4th clock cycle is incorrect");
      $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Check state after reset
    if (state !== 4'b0001) begin
      $display("FAIL: State after reset is not idle");
      $finish;
    end

    // Final check to ensure FSM cycles correctly again
    #10; // Wait for one clock cycle
    if (state !== 4'b0010 || op !== 2'b00) begin
      $display("FAIL: State after 1st clock cycle post-reset is incorrect");
      $finish;
    end

    #10; // Wait for one clock cycle
    if (state !== 4'b0100 || op !== 2'b01) begin
      $display("FAIL: State after 2nd clock cycle post-reset is incorrect");
      $finish;
    end

    #10; // Wait for one clock cycle
    if (state !== 4'b1000 || op !== 2'b10) begin
      $display("FAIL: State after 3rd clock cycle post-reset is incorrect");
      $finish;
    end

    #10; // Wait for one clock cycle
    if (state !== 4'b0001 || op !== 2'b11) begin
      $display("FAIL: State after 4th clock cycle post-reset is incorrect");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule