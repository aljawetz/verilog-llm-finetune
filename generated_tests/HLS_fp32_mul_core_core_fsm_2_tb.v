`timescale 1ns/1ps

module tb_HLS_fp32_mul_core_core_fsm;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_mul_core_core_fsm uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .core_wen(core_wen),
    .fsm_output(fsm_output)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    core_wen = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Test case 2: Transition to main state
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: After core_wen asserted, expected output 2'b10, got %b", fsm_output);
      $finish;
    end

    // Test case 3: Stay in main state
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10 in main state, got %b", fsm_output);
      $finish;
    end

    // Test case 4: Deassert core_wen and check state
    core_wen = 0;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10 when core_wen is deasserted, got %b", fsm_output);
      $finish;
    end

    // Test case 5: Assert core_wen again
    core_wen = 1;
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: Expected output to remain 2'b10 after asserting core_wen again, got %b", fsm_output);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule