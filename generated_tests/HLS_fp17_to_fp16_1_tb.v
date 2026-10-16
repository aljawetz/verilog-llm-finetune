`timescale 1ns/1ps

module tb_HLS_fp17_to_fp16;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
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
      $display("FAIL: Initial state output is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable core write
    core_wen = 1;

    // Wait for a clock cycle
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output after enabling core_wen is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Check state remains the same on subsequent clock cycles
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 2'b10, got %b", fsm_output);
      $finish;
    end

    // Disable core write
    core_wen = 0;

    // Wait for a clock cycle
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output should remain 2'b10 when core_wen is disabled, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule