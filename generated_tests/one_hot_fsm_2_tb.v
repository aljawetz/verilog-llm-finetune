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
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial state
    if (state !== 4'b0001) begin
      $display("FAIL: Initial state is not IDLE");
      $finish;
    end

    // Cycle through states
    #10; // Wait for 1 clock cycle
    if (out !== 2'b00 || state !== 4'b0010) begin
      $display("FAIL: After IDLE, out=%b, state=%b", out, state);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 2'b01 || state !== 4'b0100) begin
      $display("FAIL: After STATE1, out=%b, state=%b", out, state);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 2'b10 || state !== 4'b1000) begin
      $display("FAIL: After STATE2, out=%b, state=%b", out, state);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (out !== 2'b11 || state !== 4'b0001) begin
      $display("FAIL: After STATE3, out=%b, state=%b", out, state);
      $finish;
    end

    // Test reset functionality
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check state after reset
    if (state !== 4'b0001) begin
      $display("FAIL: After reset, state is not IDLE");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule