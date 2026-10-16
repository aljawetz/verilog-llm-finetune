`timescale 1ns/1ps

module tb_HLS_uint16_to_fp17_core_chn_a_rsci_chn_a_wait_ctrl;

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
  HLS_uint16_to_fp17_core_chn_a_rsci_chn_a_wait_ctrl uut (
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
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    chn_a_rsci_oswt = 0;
    core_wen = 0;
    chn_a_rsci_iswt0 = 0;
    chn_a_rsci_ld_core_psct = 0;
    core_wten = 0;
    chn_a_rsci_vd = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Check behavior with core_wten = 0
    core_wten = 0;
    chn_a_rsci_iswt0 = 1;
    chn_a_rsci_vd = 1;
    #10;
    if (chn_a_rsci_biwt !== 1) begin
      $display("FAIL: Test case 1 failed, expected chn_a_rsci_biwt = 1");
      $finish;
    end

    // Test case 2: Check behavior with core_wen = 1 and oswt = 1
    core_wen = 1;
    chn_a_rsci_oswt = 1;
    #10;
    if (chn_a_rsci_bdwt !== 1) begin
      $display("FAIL: Test case 2 failed, expected chn_a_rsci_bdwt = 1");
      $finish;
    end

    // Test case 3: Check loading core signal
    chn_a_rsci_ld_core_psct = 1;
    #10;
    if (chn_a_rsci_ld_core_sct !== 1) begin
      $display("FAIL: Test case 3 failed, expected chn_a_rsci_ld_core_sct = 1");
      $finish;
    end

    // Test case 4: Check behavior with core_wten = 1
    core_wten = 1;
    chn_a_rsci_iswt0 = 0;
    #10;
    if (chn_a_rsci_biwt !== 0) begin
      $display("FAIL: Test case 4 failed, expected chn_a_rsci_biwt = 0");
      $finish;
    end

    // Test case 5: Reset behavior
    nvdla_core_rstn = 0;
    #10;
    nvdla_core_rstn = 1;
    #10;
    if (uut.chn_a_rsci_icwt !== 0) begin
      $display("FAIL: Test case 5 failed, expected chn_a_rsci_icwt = 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule