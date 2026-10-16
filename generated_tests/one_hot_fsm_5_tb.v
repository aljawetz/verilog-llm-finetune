`timescale 1ns/1ps

module tb_one_hot_fsm;

  reg clk;
  reg reset;
  wire [3:0] state;
  wire [1:0] out;

  // Instantiate the module under test (uut)
  one_hot_fsm uut (
    .clk(clk),
    .reset(reset),
    .state(state),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for a clock cycle
    reset = 0;

    // Check initial state
    if (state !== 4'b0001) begin
      $display("FAIL: Initial state is not IDLE");
      $finish;
    end

    // Cycle through states
    #10; // Wait for next clock
    if (state !== 4'b0010 || out !== 2'b00) begin
      $display("FAIL: State after IDLE is not STATE1");
      $finish;
    end

    #10; // Wait for next clock
    if (state !== 4'b0100 || out !== 2'b01) begin
      $display("FAIL: State after STATE1 is not STATE2");
      $finish;
    end

    #10; // Wait for next clock
    if (state !== 4'b1000 || out !== 2'b10) begin
      $display("FAIL: State after STATE2 is not STATE3");
      $finish;
    end

    #10; // Wait for next clock
    if (state !== 4'b0001 || out !== 2'b11) begin
      $display("FAIL: State after STATE3 is not IDLE");
      $finish;
    end

    // Assert reset functionality
    reset = 1;
    #10; // Wait for a clock cycle
    reset = 0;

    // Check state after reset
    if (state !== 4'b0001) begin
      $display("FAIL: State after reset is not IDLE");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule