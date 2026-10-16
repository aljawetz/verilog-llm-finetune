`timescale 1ns/1ps

module tb_HLS_fp32_sub;

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
    nvdla_core_rstn = 1;

    // Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;

    // Check output after first state transition
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after state transition is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Disable core_wen and check if output remains the same
    core_wen = 0;
    #10;

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same when core_wen is deasserted, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Re-enable core_wen and check output again
    core_wen = 1;
    #10;

    // Check output after re-enabling core_wen
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after re-enabling core_wen is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule