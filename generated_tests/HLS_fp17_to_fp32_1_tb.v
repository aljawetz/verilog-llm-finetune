`timescale 1ns/1ps

module tb_HLS_fp17_to_fp32;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp17_to_fp32_core_core_fsm uut (
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
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1; // Enable write
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: After enabling core_wen, expected output 2'b10, got %b", fsm_output);
      $finish;
    end

    // Keep core_wen enabled and check if state remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10, got %b", fsm_output);
      $finish;
    end

    // Disable core_wen and check if state remains the same
    core_wen = 0; // Disable write
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10 when core_wen is disabled, got %b", fsm_output);
      $finish;
    end

    // Re-enable core_wen and check state transition
    core_wen = 1; // Enable write again
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10 after re-enabling core_wen, got %b", fsm_output);
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule