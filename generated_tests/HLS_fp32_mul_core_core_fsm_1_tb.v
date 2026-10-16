`timescale 1ns/1ps

module tb_HLS_fp32_mul_core_core_fsm;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp32_mul_core_core_fsm uut (
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
    #10;

    // Check initial state
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state is incorrect, expected 2'b01 but got %b", fsm_output);
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;

    // Check state after enabling core_wen
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after enabling core_wen is incorrect, expected 2'b10 but got %b", fsm_output);
      $finish;
    end

    // Continue to check the output remains the same
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain 2'b10 but got %b", fsm_output);
      $finish;
    end

    // Disable core_wen and check if output remains the same
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain 2'b10 after disabling core_wen but got %b", fsm_output);
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule