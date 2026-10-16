`timescale 1ns/1ps

module tb_HLS_fp17_to_fp16_core_core_fsm;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_fp17_to_fp16_core_core_fsm uut (
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

    // Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial output after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Test core_wen assertion
    core_wen = 1; // Assert core_wen
    #10; // Wait for one clock cycle

    // Check output after core_wen is asserted
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after core_wen asserted is incorrect, got %b", fsm_output);
      $finish;
    end

    // Deassert core_wen and check output
    core_wen = 0; 
    #10; // Wait for one clock cycle

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same when core_wen is deasserted, got %b", fsm_output);
      $finish;
    end

    // Assert core_wen again
    core_wen = 1; 
    #10; // Wait for one clock cycle

    // Check output again
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after reasserting core_wen is incorrect, got %b", fsm_output);
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule