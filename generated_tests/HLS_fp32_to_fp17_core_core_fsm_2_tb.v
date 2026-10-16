`timescale 1ns/1ps

module tb_HLS_fp32_to_fp17_core_core_fsm;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_to_fp17_core_core_fsm uut (
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
    // Initialize inputs
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Check initial state
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect");
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling core_wen is incorrect");
      $finish;
    end

    // Check state remains the same with core_wen held high
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same when core_wen is high");
      $finish;
    end

    // Disable core_wen and check state does not change
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same when core_wen is low");
      $finish;
    end

    // Re-enable core_wen and check state transition again
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after re-enabling core_wen is incorrect");
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule