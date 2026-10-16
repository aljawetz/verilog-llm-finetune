`timescale 1ns/1ps

module tb_HLS_fp32_sub_core_core_fsm;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp32_sub_core_core_fsm uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .core_wen(core_wen),
    .fsm_output(fsm_output)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Wait for a clock cycle
    #10;

    // Enable the FSM
    core_wen = 1;

    // Check initial state output after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial output after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Wait for a clock cycle
    #10;

    // Check output after first state transition
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after first transition is incorrect, got %b", fsm_output);
      $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check output remains the same in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state, got %b", fsm_output);
      $finish;
    end

    // Disable the FSM
    core_wen = 0;

    // Wait for a clock cycle
    #10;

    // Check output remains the same when disabled
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain unchanged when disabled, got %b", fsm_output);
      $finish;
    end

    // Re-enable the FSM
    core_wen = 1;

    // Wait for a clock cycle
    #10;

    // Check output after re-enabling
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after re-enabling should be in main state, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule