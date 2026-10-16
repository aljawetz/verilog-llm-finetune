`timescale 1ns/1ps

module tb_HLS_fp32_mul_core;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test
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
    nvdla_core_rstn = 1;

    // Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state is not 2'b01");
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;

    // Check output after enabling
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output is not 2'b10 after core_wen is asserted");
      $finish;
    end

    // Check state remains the same when core_wen is still asserted
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output changed unexpectedly when core_wen is still asserted");
      $finish;
    end

    // Deassert core_wen and check output
    core_wen = 0;
    #10;

    // Check output remains the same when core_wen is deasserted
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output changed unexpectedly when core_wen is deasserted");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule