`timescale 1ns/1ps

module tb_HLS_fp17_sub_core_chn_b_rsci_chn_b_wait_ctrl;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_b_rsci_oswt;
  reg core_wen;
  reg core_wten;
  reg chn_b_rsci_iswt0;
  reg chn_b_rsci_ld_core_psct;
  wire chn_b_rsci_biwt;
  wire chn_b_rsci_bdwt;
  wire chn_b_rsci_ld_core_sct;
  reg chn_b_rsci_vd;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp17_sub_core_chn_b_rsci_chn_b_wait_ctrl uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .chn_b_rsci_oswt(chn_b_rsci_oswt),
    .core_wen(core_wen),
    .core_wten(core_wten),
    .chn_b_rsci_iswt0(chn_b_rsci_iswt0),
    .chn_b_rsci_ld_core_psct(chn_b_rsci_ld_core_psct),
    .chn_b_rsci_biwt(chn_b_rsci_biwt),
    .chn_b_rsci_bdwt(chn_b_rsci_bdwt),
    .chn_b_rsci_ld_core_sct(chn_b_rsci_ld_core_sct),
    .chn_b_rsci_vd(chn_b_rsci_vd)
  );

  // Clock Generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and Test Sequence
  initial begin
    // Initialize Inputs
    nvdla_core_rstn = 0;
    chn_b_rsci_oswt = 0;
    core_wen = 0;
    core_wten = 0;
    chn_b_rsci_iswt0 = 0;
    chn_b_rsci_ld_core_psct = 0;
    chn_b_rsci_vd = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test Case 1: Basic functionality
    // Test with core_wten = 0, chn_b_rsci_iswt0 = 1, expect chn_b_rsci_biwt = 0
    core_wten = 0;
    chn_b_rsci_iswt0 = 1;
    #10;
    if (chn_b_rsci_biwt !== 0) begin
      $display("FAIL: Test Case 1 failed, expected chn_b_rsci_biwt = 0");
      $finish;
    end

    // Test Case 2: Enable biwt
    // Test with core_wten = 0, chn_b_rsci_iswt0 = 1, chn_b_rsci_vd = 1, expect chn_b_rsci_biwt = 1
    chn_b_rsci_vd = 1;
    #10;
    if (chn_b_rsci_biwt !== 1) begin
      $display("FAIL: Test Case 2 failed, expected chn_b_rsci_biwt = 1");
      $finish;
    end

    // Test Case 3: Check bdwt
    // Test with chn_b_rsci_oswt = 1 and core_wen = 1, expect chn_b_rsci_bdwt = 1
    chn_b_rsci_oswt = 1;
    core_wen = 1;
    #10;
    if (chn_b_rsci_bdwt !== 1) begin
      $display("FAIL: Test Case 3 failed, expected chn_b_rsci_bdwt = 1");
      $finish;
    end

    // Test Case 4: Check ld_core_sct
    // Test with chn_b_rsci_ld_core_psct = 1 and chn_b_rsci_ogwt = 1, expect chn_b_rsci_ld_core_sct = 1
    chn_b_rsci_ld_core_psct = 1;
    #10;
    if (chn_b_rsci_ld_core_sct !== 1) begin
      $display("FAIL: Test Case 4 failed, expected chn_b_rsci_ld_core_sct = 1");
      $finish;
    end

    // Test Case 5: Reset behavior
    nvdla_core_rstn = 0;
    #10;
    if (uut.chn_b_rsci_icwt !== 0) begin
      $display("FAIL: Reset failed, expected chn_b_rsci_icwt = 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule