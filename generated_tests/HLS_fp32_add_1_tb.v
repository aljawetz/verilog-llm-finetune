`timescale 1ns/1ps

module tb_HLS_fp32_add;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg core_wen;
  wire [1:0] fsm_output;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_add_core_core_fsm uut (
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

    // Test 1: Check initial state after reset
    #10;
    if (fsm_output !== 2'b01) begin
      $display("FAIL: Initial state after reset is incorrect, got %b", fsm_output);
      $finish;
    end

    // Test 2: Transition to main state
    core_wen = 1; // Enable write
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State after enabling write is incorrect, got %b", fsm_output);
      $finish;
    end

    // Test 3: Stay in main state
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain in main state, got %b", fsm_output);
      $finish;
    end

    // Test 4: Disable write and check state
    core_wen = 0; // Disable write
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain in main state when write is disabled, got %b", fsm_output);
      $finish;
    end

    // Test 5: Re-enable write and check state
    core_wen = 1; // Re-enable write
    #10;
    if (fsm_output !== 2'b10) begin
      $display("FAIL: State should remain in main state after re-enabling write, got %b", fsm_output);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule