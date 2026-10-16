`timescale 1ns/1ps

module tb_NV_NVDLA_SDP_CORE_Y_idx_core;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  NV_NVDLA_SDP_CORE_Y_idx_core_core_fsm uut (
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

    // Reset the FSM
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Wait for a few clock cycles
    #10;
    if (fsm_output !== 2'b1) begin
      $display("FAIL: Initial output after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Enable the FSM
    core_wen = 1;

    // Check the output for several clock cycles
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling FSM is incorrect, got %b", fsm_output);
      $finish;
    end

    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after one clock cycle is incorrect, got %b", fsm_output);
      $finish;
    end

    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after two clock cycles is incorrect, got %b", fsm_output);
      $finish;
    end

    // Disable the FSM
    core_wen = 0;

    // Check output remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after disabling FSM is incorrect, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule