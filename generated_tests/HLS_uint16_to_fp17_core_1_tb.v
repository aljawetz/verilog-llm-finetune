`timescale 1ns/1ps

module tb_HLS_uint16_to_fp17_core;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_uint16_to_fp17_core_core_fsm uut (
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

    // Test case 1: Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial output after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Test case 2: Transition to main state
    core_wen = 1; // Enable state transition
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling transition is incorrect, got %b", fsm_output);
      $finish;
    end

    // Test case 3: Stay in main state
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state, got %b", fsm_output);
      $finish;
    end

    // Test case 4: Disable transition and check output
    core_wen = 0; // Disable state transition
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // Test case 5: Re-enable transition
    core_wen = 1; // Enable state transition again
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain in main state after re-enabling, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule