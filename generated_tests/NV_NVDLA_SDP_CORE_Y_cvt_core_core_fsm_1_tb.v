`timescale 1ns/1ps

module tb_NV_NVDLA_SDP_CORE_Y_cvt_core_core_fsm;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
  NV_NVDLA_SDP_CORE_Y_cvt_core_core_fsm uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .core_wen(core_wen),
    .fsm_output(fsm_output)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Wait for a clock cycle
    #10;

    // Check initial state after reset
    if (fsm_output !== 2'b1) begin
      $display("FAIL: Initial state after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Enable write and check state transition
    core_wen = 1;
    #10;

    // Check output after enabling
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling is incorrect, got %b", fsm_output);
      $finish;
    end

    // Hold state and check output
    #10;

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same, got %b", fsm_output);
      $finish;
    end

    // Disable write and check output
    core_wen = 0;
    #10;

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // Enable write again and check state transition
    core_wen = 1;
    #10;

    // Check output after enabling again
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling again is incorrect, got %b", fsm_output);
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule