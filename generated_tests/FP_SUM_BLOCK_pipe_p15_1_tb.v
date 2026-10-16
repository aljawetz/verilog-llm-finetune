`timescale 1ns/1ps

module tb_FP_SUM_BLOCK_pipe_p15;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [31:0] stage3_pipe_in_pd_d2;
  reg stage3_pipe_in_rdy_d3;
  reg stage3_pipe_in_vld_d2;
  wire [31:0] stage3_pipe_in_pd_d3;
  wire stage3_pipe_in_rdy_d2;
  wire stage3_pipe_in_vld_d3;

  // Instantiate the module under test
  FP_SUM_BLOCK_pipe_p15 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .stage3_pipe_in_pd_d2(stage3_pipe_in_pd_d2),
    .stage3_pipe_in_rdy_d3(stage3_pipe_in_rdy_d3),
    .stage3_pipe_in_vld_d2(stage3_pipe_in_vld_d2),
    .stage3_pipe_in_pd_d3(stage3_pipe_in_pd_d3),
    .stage3_pipe_in_rdy_d2(stage3_pipe_in_rdy_d2),
    .stage3_pipe_in_vld_d3(stage3_pipe_in_vld_d3)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and test sequence
  initial begin
    nvdla_core_rstn = 0;
    stage3_pipe_in_pd_d2 = 32'h0;
    stage3_pipe_in_rdy_d3 = 0;
    stage3_pipe_in_vld_d2 = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    // Test case 1: Valid data transfer
    stage3_pipe_in_pd_d2 = 32'hA5A5A5A5;
    stage3_pipe_in_vld_d2 = 1;
    stage3_pipe_in_rdy_d3 = 1; // Ready to accept data
    #10;

    if (stage3_pipe_in_pd_d3 !== 32'hA5A5A5A5 || stage3_pipe_in_vld_d3 !== 1) begin
      $display("FAIL: Data transfer failed in test case 1");
      $finish;
    end

    // Test case 2: Valid data not ready
    stage3_pipe_in_vld_d2 = 1;
    stage3_pipe_in_rdy_d3 = 0; // Not ready to accept data
    #10;

    if (stage3_pipe_in_vld_d3 !== 1) begin
      $display("FAIL: Valid signal should remain high when not ready in test case 2");
      $finish;
    end

    // Test case 3: Reset behavior
    nvdla_core_rstn = 0; // Assert reset
    #10;

    if (stage3_pipe_in_vld_d3 !== 0) begin
      $display("FAIL: Valid signal should be low after reset in test case 3");
      $finish;
    end

    // Test case 4: Data transfer after reset
    nvdla_core_rstn = 1; // Release reset
    stage3_pipe_in_pd_d2 = 32'h5A5A5A5A;
    stage3_pipe_in_vld_d2 = 1;
    stage3_pipe_in_rdy_d3 = 1; // Ready to accept data
    #10;

    if (stage3_pipe_in_pd_d3 !== 32'h5A5A5A5A || stage3_pipe_in_vld_d3 !== 1) begin
      $display("FAIL: Data transfer failed after reset in test case 4");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule