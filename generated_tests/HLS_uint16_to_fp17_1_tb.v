`timescale 1ns/1ps

module tb_HLS_uint16_to_fp17;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the module under test (uut)
  HLS_uint16_to_fp17_core_core_fsm uut (
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
    nvdla_core_rstn = 1;

    // Check initial state
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Enable core_wen and check state transition
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after core_wen is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Check that the state remains the same when core_wen is still active
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain 2'b10 while core_wen is active, got %b", fsm_output);
      $finish;
    end

    // Disable core_wen and check state remains the same
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain 2'b10 after core_wen is deactivated, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule