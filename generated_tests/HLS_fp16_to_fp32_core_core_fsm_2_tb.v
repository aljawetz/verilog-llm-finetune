`timescale 1ns/1ps

module tb_HLS_fp16_to_fp32_core_core_fsm;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp16_to_fp32_core_core_fsm uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .core_wen(core_wen),
    .fsm_output(fsm_output)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    // Check initial state
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, expected 01, got %b", fsm_output);
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;

    // Check output after first transition
    if (fsm_output !== 2'b10) begin
      $display("FAIL: After first transition output is incorrect, expected 10, got %b", fsm_output);
      $finish;
    end

    // Keep core_wen high and check if state remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 10 when core_wen is high, got %b", fsm_output);
      $finish;
    end

    // Disable core_wen and check if state does not change
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 10 when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // Re-enable core_wen and check state transition again
    core_wen = 1;
    #10;

    // Check output after re-enabling core_wen
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should still be 10 after re-enabling core_wen, got %b", fsm_output);
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule