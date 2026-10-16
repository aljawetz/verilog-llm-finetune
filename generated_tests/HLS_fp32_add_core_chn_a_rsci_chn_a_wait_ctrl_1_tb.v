`timescale 1ns/1ps

module tb_HLS_fp32_add_core_chn_a_rsci_chn_a_wait_ctrl;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_a_rsci_oswt;
  reg core_wen;
  reg chn_a_rsci_iswt0;
  reg chn_a_rsci_ld_core_psct;
  reg core_wten;
  wire chn_a_rsci_biwt;
  wire chn_a_rsci_bdwt;
  wire chn_a_rsci_ld_core_sct;
  reg chn_a_rsci_vd;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_add_core_chn_a_rsci_chn_a_wait_ctrl uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .chn_a_rsci_oswt(chn_a_rsci_oswt),
    .core_wen(core_wen),
    .chn_a_rsci_iswt0(chn_a_rsci_iswt0),
    .chn_a_rsci_ld_core_psct(chn_a_rsci_ld_core_psct),
    .core_wten(core_wten),
    .chn_a_rsci_biwt(chn_a_rsci_biwt),
    .chn_a_rsci_bdwt(chn_a_rsci_bdwt),
    .chn_a_rsci_ld_core_sct(chn_a_rsci_ld_core_sct),
    .chn_a_rsci_vd(chn_a_rsci_vd)
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
    chn_a_rsci_oswt = 0;
    core_wen = 0;
    chn_a_rsci_iswt0 = 0;
    chn_a_rsci_ld_core_psct = 0;
    core_wten = 0;
    chn_a_rsci_vd = 0;

    // Reset the module
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Basic functionality with valid inputs
    chn_a_rsci_iswt0 = 1;
    core_wten = 0;
    chn_a_rsci_vd = 1;
    #10;

    if (uut.chn_a_rsci_biwt !== 1) begin
      $display("FAIL: Test case 1 failed, expected chn_a_rsci_biwt to be 1");
      $finish;
    end

    // Test case 2: Check output when core_wen is enabled
    core_wen = 1;
    chn_a_rsci_oswt = 1;
    #10;

    if (uut.chn_a_rsci_bdwt !== 1) begin
      $display("FAIL: Test case 2 failed, expected chn_a_rsci_bdwt to be 1");
      $finish;
    end

    // Test case 3: Check ld_core_sct when valid and enabled
    chn_a_rsci_ld_core_psct = 1;
    #10;

    if (uut.chn_a_rsci_ld_core_sct !== 1) begin
      $display("FAIL: Test case 3 failed, expected chn_a_rsci_ld_core_sct to be 1");
      $finish;
    end

    // Test case 4: Check behavior with core_wten enabled
    core_wten = 1;
    chn_a_rsci_iswt0 = 0;
    #10;

    if (uut.chn_a_rsci_biwt !== 0) begin
      $display("FAIL: Test case 4 failed, expected chn_a_rsci_biwt to be 0");
      $finish;
    end

    // Test case 5: Reset behavior
    nvdla_core_rstn = 0;
    #10;
    nvdla_core_rstn = 1;
    #10;

    if (uut.chn_a_rsci_icwt !== 0) begin
      $display("FAIL: Test case 5 failed, expected chn_a_rsci_icwt to be 0 after reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule