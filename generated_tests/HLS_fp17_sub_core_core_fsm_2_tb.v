`timescale 1ns/1ps

module tb_HLS_fp17_sub_core_core_fsm;

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
    // Initialize signals
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Check initial state
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, got %b", fsm_output);
      $finish;
    end

    // Assert core_wen to transition to main state
    core_wen = 1;
    #10;

    // Check state after core_wen asserted
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after core_wen asserted is incorrect, got %b", fsm_output);
      $finish;
    end

    // Deassert core_wen and check if state remains the same
    core_wen = 0;
    #10;

    // Check state remains in main state
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after deasserting core_wen is incorrect, got %b", fsm_output);
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule