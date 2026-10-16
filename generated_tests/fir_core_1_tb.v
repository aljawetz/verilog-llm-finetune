`timescale 1ns/1ps

module tb_fir_core;

  reg clk;
  reg rst;
  reg Shift_Accum_Loop_C_6_tr0;
  wire [8:0] fsm_output;

  // Instantiate the module under test
  fir_core_core_fsm uut (
    .clk(clk),
    .rst(rst),
    .fsm_output(fsm_output),
    .Shift_Accum_Loop_C_6_tr0(Shift_Accum_Loop_C_6_tr0)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    Shift_Accum_Loop_C_6_tr0 = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test state transitions and outputs
    // Check initial state
    if (fsm_output !== 9'b000000001) begin
      $display("FAIL: Initial state output incorrect");
      $finish;
    end

    // Transition through states
    #10; // Shift_Accum_Loop_C_0
    if (fsm_output !== 9'b000000010) begin
      $display("FAIL: Output at Shift_Accum_Loop_C_0 incorrect");
      $finish;
    end

    #10; // Shift_Accum_Loop_C_1
    if (fsm_output !== 9'b000000100) begin
      $display("FAIL: Output at Shift_Accum_Loop_C_1 incorrect");
      $finish;
    end

    #10; // Shift_Accum_Loop_C_2
    if (fsm_output !== 9'b000001000) begin
      $display("FAIL: Output at Shift_Accum_Loop_C_2 incorrect");
      $finish;
    end

    #10; // Shift_Accum_Loop_C_3
    if (fsm_output !== 9'b000010000) begin
      $display("FAIL: Output at Shift_Accum_Loop_C_3 incorrect");
      $finish;
    end

    #10; // Shift_Accum_Loop_C_4
    if (fsm_output !== 9'b000100000) begin
      $display("FAIL: Output at Shift_Accum_Loop_C_4 incorrect");
      $finish;
    end

    #10; // Shift_Accum_Loop_C_5
    if (fsm_output !== 9'b001000000) begin
      $display("FAIL: Output at Shift_Accum_Loop_C_5 incorrect");
      $finish;
    end

    #10; // Shift_Accum_Loop_C_6
    if (fsm_output !== 9'b010000000) begin
      $display("FAIL: Output at Shift_Accum_Loop_C_6 incorrect");
      $finish;
    end

    // Test transition to main_C_1
    Shift_Accum_Loop_C_6_tr0 = 1; // Trigger transition
    #10; // main_C_1
    if (fsm_output !== 9'b100000000) begin
      $display("FAIL: Output at main_C_1 incorrect");
      $finish;
    end

    // Reset to initial state
    rst = 1;
    #10;
    rst = 0;

    // Final check for initial state
    if (fsm_output !== 9'b000000001) begin
      $display("FAIL: Output after reset incorrect");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule