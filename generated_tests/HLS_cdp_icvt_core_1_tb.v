`timescale 1ns/1ps

module tb_HLS_cdp_icvt_core;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_cdp_icvt_core_core_fsm uut (
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

    // Wait for a clock cycle
    #10;

    // Enable core
    core_wen = 1;

    // Check the output after enabling
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected fsm_output to be 2'b10 after enabling, got %b", fsm_output);
      $finish;
    end

    // Check the output remains the same in the main state
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected fsm_output to remain 2'b10, got %b", fsm_output);
      $finish;
    end

    // Disable core
    core_wen = 0;

    // Check the output should not change
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected fsm_output to remain 2'b10 when core_wen is low, got %b", fsm_output);
      $finish;
    end

    // Re-enable core
    core_wen = 1;

    // Check the output again
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected fsm_output to be 2'b10 after re-enabling, got %b", fsm_output);
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule