`timescale 1ns/1ps

module tb_HLS_fp17_sub;

  // Parameters
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
    // Initialize inputs
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    // Check initial state
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // Test core_wen active
    core_wen = 1; // Activate core_wen
    #10;

    // Check state after core_wen is active
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after core_wen active is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Deactivate core_wen and check state remains the same
    core_wen = 0; 
    #10;

    // Check state remains the same
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after core_wen deactivated is incorrect, expected 2'b10, got %b", fsm_output);
      $finish;
    end

    // Apply reset again
    nvdla_core_rstn = 0;
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    // Check state after reset
    if (fsm_output !== 2'b01) begin
      $display("FAIL: State after reset is incorrect, expected 2'b01, got %b", fsm_output);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule