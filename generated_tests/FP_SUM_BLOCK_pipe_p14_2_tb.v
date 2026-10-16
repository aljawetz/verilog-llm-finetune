`timescale 1ns/1ps

module tb_FP_SUM_BLOCK_pipe_p14;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [31:0] stage3_pipe_in_pd_d1;
  reg stage3_pipe_in_rdy_d2;
  reg stage3_pipe_in_vld_d1;
  wire [31:0] stage3_pipe_in_pd_d2;
  wire stage3_pipe_in_rdy_d1;
  wire stage3_pipe_in_vld_d2;

  // Instantiate the Unit Under Test (UUT)
  FP_SUM_BLOCK_pipe_p14 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .stage3_pipe_in_pd_d1(stage3_pipe_in_pd_d1),
    .stage3_pipe_in_rdy_d2(stage3_pipe_in_rdy_d2),
    .stage3_pipe_in_vld_d1(stage3_pipe_in_vld_d1),
    .stage3_pipe_in_pd_d2(stage3_pipe_in_pd_d2),
    .stage3_pipe_in_rdy_d1(stage3_pipe_in_rdy_d1),
    .stage3_pipe_in_vld_d2(stage3_pipe_in_vld_d2)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    stage3_pipe_in_pd_d1 = 32'h0;
    stage3_pipe_in_rdy_d2 = 0;
    stage3_pipe_in_vld_d1 = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Valid data transfer
    #10;
    stage3_pipe_in_pd_d1 = 32'hA5A5A5A5; // Sample data
    stage3_pipe_in_vld_d1 = 1; // Valid data
    stage3_pipe_in_rdy_d2 = 1; // Ready to receive
    #10;

    // Check output
    if (stage3_pipe_in_pd_d2 !== 32'hA5A5A5A5 || stage3_pipe_in_vld_d2 !== 1) begin
      $display("FAIL: Output data mismatch on valid transfer");
      $finish;
    end

    // Test case 2: Valid data not ready
    #10;
    stage3_pipe_in_pd_d1 = 32'h5A5A5A5A; // New sample data
    stage3_pipe_in_vld_d1 = 1; // Valid data
    stage3_pipe_in_rdy_d2 = 0; // Not ready to receive
    #10;

    // Check output should remain the same
    if (stage3_pipe_in_pd_d2 !== 32'hA5A5A5A5 || stage3_pipe_in_vld_d2 !== 1) begin
      $display("FAIL: Output data mismatch when not ready");
      $finish;
    end

    // Test case 3: Valid data transfer after ready
    #10;
    stage3_pipe_in_rdy_d2 = 1; // Ready to receive
    #10;

    // Check output should now be updated
    if (stage3_pipe_in_pd_d2 !== 32'h5A5A5A5A || stage3_pipe_in_vld_d2 !== 1) begin
      $display("FAIL: Output data mismatch on second valid transfer");
      $finish;
    end

    // Test case 4: Valid data with bubble collapse
    #10;
    stage3_pipe_in_vld_d1 = 0; // No valid data
    #10;

    // Check output should not change
    if (stage3_pipe_in_pd_d2 !== 32'h5A5A5A5A || stage3_pipe_in_vld_d2 !== 0) begin
      $display("FAIL: Output data mismatch during bubble collapse");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule