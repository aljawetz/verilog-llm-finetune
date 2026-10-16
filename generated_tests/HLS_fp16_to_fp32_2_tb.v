`timescale 1ns/1ps

module tb_HLS_fp16_to_fp32;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test
  HLS_fp16_to_fp32_core_core_fsm uut (
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

    // Wait for a clock cycle
    #10;

    // Enable core write
    core_wen = 1;

    // Check initial state output
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state output is incorrect, got %b", fsm_output);
      $finish;
    end

    // Wait for a clock cycle
    #10;

    // Check output after enabling
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling is incorrect, got %b", fsm_output);
      $finish;
    end

    // Wait for another clock cycle
    #10;

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same, got %b", fsm_output);
      $finish;
    end

    // Disable core write
    core_wen = 0;

    // Wait for a clock cycle
    #10;

    // Check output remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain the same when disabled, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule