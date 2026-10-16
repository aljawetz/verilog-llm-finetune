`timescale 1ns/1ps

module tb_HLS_fp17_add_core;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp17_add_core_core_fsm uut (
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
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Test core_wen assertion
    core_wen = 1; // Assert core_wen
    #10;

    // Check output after core_wen is asserted
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after core_wen is asserted is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Test deasserting core_wen
    core_wen = 0; // Deassert core_wen
    #10;

    // Check output remains the same after deasserting core_wen
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after deasserting core_wen is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Test another cycle with core_wen asserted
    core_wen = 1; // Assert core_wen again
    #10;

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output during second assertion of core_wen is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule