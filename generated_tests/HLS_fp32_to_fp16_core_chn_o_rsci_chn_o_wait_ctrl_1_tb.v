`timescale 1ns/1ps

module tb_HLS_fp32_to_fp16_core_chn_o_rsci_chn_o_wait_ctrl;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_o_rsci_oswt;
  reg core_wen;
  reg core_wten;
  reg chn_o_rsci_iswt0;
  reg chn_o_rsci_ld_core_psct;
  reg chn_o_rsci_vd;
  wire chn_o_rsci_biwt;
  wire chn_o_rsci_bdwt;
  wire chn_o_rsci_ld_core_sct;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_to_fp16_core_chn_o_rsci_chn_o_wait_ctrl uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .chn_o_rsci_oswt(chn_o_rsci_oswt),
    .core_wen(core_wen),
    .core_wten(core_wten),
    .chn_o_rsci_iswt0(chn_o_rsci_iswt0),
    .chn_o_rsci_ld_core_psct(chn_o_rsci_ld_core_psct),
    .chn_o_rsci_biwt(chn_o_rsci_biwt),
    .chn_o_rsci_bdwt(chn_o_rsci_bdwt),
    .chn_o_rsci_ld_core_sct(chn_o_rsci_ld_core_sct),
    .chn_o_rsci_vd(chn_o_rsci_vd)
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
    chn_o_rsci_oswt = 0;
    core_wen = 0;
    core_wten = 0;
    chn_o_rsci_iswt0 = 0;
    chn_o_rsci_ld_core_psct = 0;
    chn_o_rsci_vd = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Check behavior with core_wten = 0 and chn_o_rsci_iswt0 = 1
    core_wten = 0;
    chn_o_rsci_iswt0 = 1;
    #10;
    if (chn_o_rsci_biwt !== 0) begin
      $display("FAIL: Test case 1 failed, expected chn_o_rsci_biwt = 0");
      $finish;
    end

    // Test case 2: Check behavior with core_wten = 1 and chn_o_rsci_iswt0 = 1
    core_wten = 1;
    #10;
    if (chn_o_rsci_biwt !== 0) begin
      $display("FAIL: Test case 2 failed, expected chn_o_rsci_biwt = 0");
      $finish;
    end

    // Test case 3: Enable core_wen and check bdwt
    core_wen = 1;
    chn_o_rsci_oswt = 1;
    #10;
    if (chn_o_rsci_bdwt !== 1) begin
      $display("FAIL: Test case 3 failed, expected chn_o_rsci_bdwt = 1");
      $finish;
    end

    // Test case 4: Check ld_core_sct with valid inputs
    chn_o_rsci_ld_core_psct = 1;
    #10;
    if (chn_o_rsci_ld_core_sct !== 1) begin
      $display("FAIL: Test case 4 failed, expected chn_o_rsci_ld_core_sct = 1");
      $finish;
    end

    // Test case 5: Reset behavior
    nvdla_core_rstn = 0;
    #10;
    if (uut.chn_o_rsci_icwt !== 0) begin
      $display("FAIL: Test case 5 failed, expected chn_o_rsci_icwt = 0 after reset");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule