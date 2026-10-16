`timescale 1ns/1ps

module tb_HLS_fp17_sub_core_core_fsm;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
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

    // Check initial state
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial output is not 2'b01");
      $finish;
    end

    // Enable core_wen and check output
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output is not 2'b10 after enabling core_wen");
      $finish;
    end

    // Check output remains constant
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output changed unexpectedly");
      $finish;
    end

    // Disable core_wen and check output
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output changed when core_wen is disabled");
      $finish;
    end

    // Re-enable core_wen and check output
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Output is not 2'b10 after re-enabling core_wen");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule