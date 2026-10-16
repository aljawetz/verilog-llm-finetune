`timescale 1ns/1ps

module tb_HLS_fp17_sub_core;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp17_sub_core_core_fsm uut (
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

    // Test 1: Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Test 2: Enable core_wen and check state transition
    core_wen = 1; // Enable write
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: After enabling core_wen, expected output 2'b10, got %b", fsm_output);
      $finish;
    end

    // Test 3: Check that state remains the same after enabling core_wen again
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10, got %b", fsm_output);
      $finish;
    end

    // Test 4: Disable core_wen and check output remains the same
    core_wen = 0; // Disable write
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10 when core_wen is disabled, got %b", fsm_output);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule