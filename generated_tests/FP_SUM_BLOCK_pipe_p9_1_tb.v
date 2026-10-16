`timescale 1ns/1ps

module tb_FP_SUM_BLOCK_pipe_p9;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [63:0] stage2_pipe_in_pd_d0;
  reg stage2_pipe_in_rdy_d1;
  reg stage2_pipe_in_vld_d0;
  wire [63:0] stage2_pipe_in_pd_d1;
  wire stage2_pipe_in_rdy_d0;
  wire stage2_pipe_in_vld_d1;

  // Instantiate the Unit Under Test (UUT)
  FP_SUM_BLOCK_pipe_p9 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .stage2_pipe_in_pd_d0(stage2_pipe_in_pd_d0),
    .stage2_pipe_in_rdy_d1(stage2_pipe_in_rdy_d1),
    .stage2_pipe_in_vld_d0(stage2_pipe_in_vld_d0),
    .stage2_pipe_in_pd_d1(stage2_pipe_in_pd_d1),
    .stage2_pipe_in_rdy_d0(stage2_pipe_in_rdy_d0),
    .stage2_pipe_in_vld_d1(stage2_pipe_in_vld_d1)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0;
    stage2_pipe_in_rdy_d1 = 0;
    stage2_pipe_in_vld_d0 = 0;
    stage2_pipe_in_pd_d0 = 64'h0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Valid data transfer
    #10;
    stage2_pipe_in_pd_d0 = 64'hA5A5A5A5A5A5A5A5;
    stage2_pipe_in_vld_d0 = 1;
    stage2_pipe_in_rdy_d1 = 1; // Ready to receive data
    #10;

    if (stage2_pipe_in_pd_d1 !== 64'hA5A5A5A5A5A5A5A5 || stage2_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: No valid data
    #10;
    stage2_pipe_in_vld_d0 = 0; // No valid data
    #10;

    if (stage2_pipe_in_vld_d1 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Reset handling
    #10;
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    if (stage2_pipe_in_vld_d1 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Valid data with bubble collapse
    #10;
    stage2_pipe_in_pd_d0 = 64'h5A5A5A5A5A5A5A5A;
    stage2_pipe_in_vld_d0 = 1;
    stage2_pipe_in_rdy_d1 = 0; // Not ready to receive data
    #10;

    if (stage2_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Allow the next clock cycle to check for bubble collapse
    #10;
    stage2_pipe_in_rdy_d1 = 1; // Now ready to receive data
    #10;

    if (stage2_pipe_in_pd_d1 !== 64'h5A5A5A5A5A5A5A5A || stage2_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Test case 4 failed after ready");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule