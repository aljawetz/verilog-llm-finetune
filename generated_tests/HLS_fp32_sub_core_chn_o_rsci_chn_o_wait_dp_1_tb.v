`timescale 1ns/1ps

module tb_HLS_fp32_sub_core_chn_o_rsci_chn_o_wait_dp;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_o_rsci_oswt;
  wire chn_o_rsci_bawt;
  wire chn_o_rsci_wen_comp;
  reg chn_o_rsci_biwt;
  reg chn_o_rsci_bdwt;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_sub_core_chn_o_rsci_chn_o_wait_dp uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .chn_o_rsci_oswt(chn_o_rsci_oswt),
    .chn_o_rsci_bawt(chn_o_rsci_bawt),
    .chn_o_rsci_wen_comp(chn_o_rsci_wen_comp),
    .chn_o_rsci_biwt(chn_o_rsci_biwt),
    .chn_o_rsci_bdwt(chn_o_rsci_bdwt)
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
    chn_o_rsci_oswt = 0;
    chn_o_rsci_biwt = 0;
    chn_o_rsci_bdwt = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test Case 1: Check initial outputs after reset
    #10;
    if (chn_o_rsci_bawt !== 0 || chn_o_rsci_wen_comp !== 1) begin
      $display("FAIL: Initial outputs incorrect after reset");
      $finish;
    end

    // Test Case 2: Test with chn_o_rsci_oswt = 1
    chn_o_rsci_oswt = 1;
    #10;
    if (chn_o_rsci_wen_comp !== 0) begin
      $display("FAIL: wen_comp should be 0 when oswt is 1");
      $finish;
    end

    // Test Case 3: Test with chn_o_rsci_biwt = 1
    chn_o_rsci_biwt = 1;
    #10;
    if (chn_o_rsci_bawt !== 1) begin
      $display("FAIL: bawt should be 1 when biwt is 1");
      $finish;
    end

    // Test Case 4: Test with chn_o_rsci_bdwt = 1
    chn_o_rsci_bdwt = 1;
    #10;
    if (uut.chn_o_rsci_bcwt !== 0) begin
      $display("FAIL: bcwt should be 0 when bdwt is 1");
      $finish;
    end

    // Test Case 5: Check behavior with oswt = 0 and biwt = 0
    chn_o_rsci_oswt = 0;
    chn_o_rsci_biwt = 0;
    #10;
    if (chn_o_rsci_wen_comp !== 1) begin
      $display("FAIL: wen_comp should be 1 when oswt is 0 and bawt is 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule