`timescale 1ns/1ps

module tb_FP_SUM_BLOCK_pipe_p13;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [31:0] stage3_pipe_in_pd_d0;
  reg stage3_pipe_in_rdy_d1;
  reg stage3_pipe_in_vld_d0;
  wire [31:0] stage3_pipe_in_pd_d1;
  wire stage3_pipe_in_rdy_d0;
  wire stage3_pipe_in_vld_d1;

  // Instantiate the Unit Under Test (UUT)
  FP_SUM_BLOCK_pipe_p13 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .stage3_pipe_in_pd_d0(stage3_pipe_in_pd_d0),
    .stage3_pipe_in_rdy_d1(stage3_pipe_in_rdy_d1),
    .stage3_pipe_in_vld_d0(stage3_pipe_in_vld_d0),
    .stage3_pipe_in_pd_d1(stage3_pipe_in_pd_d1),
    .stage3_pipe_in_rdy_d0(stage3_pipe_in_rdy_d0),
    .stage3_pipe_in_vld_d1(stage3_pipe_in_vld_d1)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0; // Assert reset
    stage3_pipe_in_pd_d0 = 32'h0;
    stage3_pipe_in_rdy_d1 = 0;
    stage3_pipe_in_vld_d0 = 0;

    #10;
    nvdla_core_rstn = 1; // Deassert reset

    // Test case 1: Valid data transfer
    stage3_pipe_in_pd_d0 = 32'hA5A5A5A5;
    stage3_pipe_in_vld_d0 = 1; // Assert valid
    #10;
    stage3_pipe_in_rdy_d1 = 1; // Assert ready
    #10;

    if (stage3_pipe_in_pd_d1 !== 32'hA5A5A5A5 || stage3_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Data transfer failed");
      $finish;
    end

    // Test case 2: Valid data not ready
    stage3_pipe_in_pd_d0 = 32'h5A5A5A5A;
    stage3_pipe_in_vld_d0 = 1; // Assert valid
    stage3_pipe_in_rdy_d1 = 0; // Deassert ready
    #10;

    if (stage3_pipe_in_pd_d1 !== 32'hA5A5A5A5 || stage3_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Data should not change when not ready");
      $finish;
    end

    // Test case 3: Ready signal changes
    stage3_pipe_in_rdy_d1 = 1; // Assert ready
    #10;

    if (stage3_pipe_in_pd_d1 !== 32'h5A5A5A5A || stage3_pipe_in_vld_d1 !== 1) begin
      $display("FAIL: Data transfer failed after ready asserted");
      $finish;
    end

    // Test case 4: Valid signal deasserted
    stage3_pipe_in_vld_d0 = 0; // Deassert valid
    #10;

    if (stage3_pipe_in_vld_d1 !== 0) begin
      $display("FAIL: Valid signal should be deasserted");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule