`timescale 1ns/1ps

module tb_HLS_fp17_add_core_chn_b_rsci_chn_b_wait_ctrl;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_b_rsci_oswt;
  reg core_wen;
  reg core_wten;
  reg chn_b_rsci_iswt0;
  reg chn_b_rsci_ld_core_psct;
  reg chn_b_rsci_vd;
  wire chn_b_rsci_biwt;
  wire chn_b_rsci_bdwt;
  wire chn_b_rsci_ld_core_sct;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp17_add_core_chn_b_rsci_chn_b_wait_ctrl uut (
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

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    chn_b_rsci_oswt = 0;
    core_wen = 0;
    core_wten = 0;
    chn_b_rsci_iswt0 = 0;
    chn_b_rsci_ld_core_psct = 0;
    chn_b_rsci_vd = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test Case 1: Basic functionality
    // Enable signals and check outputs
    chn_b_rsci_iswt0 = 1;
    core_wten = 0;
    core_wen = 1;
    chn_b_rsci_vd = 1;
    chn_b_rsci_oswt = 1;
    chn_b_rsci_ld_core_psct = 1;

    #10;
    if (chn_b_rsci_biwt !== 1 || chn_b_rsci_bdwt !== 1 || chn_b_rsci_ld_core_sct !== 1) begin
      $display("FAIL: Test Case 1 failed");
      $finish;
    end

    // Test Case 2: Check biwt when iswt0 is low
    chn_b_rsci_iswt0 = 0;
    #10;
    if (chn_b_rsci_biwt !== 0) begin
      $display("FAIL: Test Case 2 failed");
      $finish;
    end

    // Test Case 3: Check bdwt when core_wen is low
    core_wen = 0;
    #10;
    if (chn_b_rsci_bdwt !== 0) begin
      $display("FAIL: Test Case 3 failed");
      $finish;
    end

    // Test Case 4: Check ld_core_sct when ld_core_psct is low
    chn_b_rsci_ld_core_psct = 0;
    #10;
    if (chn_b_rsci_ld_core_sct !== 0) begin
      $display("FAIL: Test Case 4 failed");
      $finish;
    end

    // Test Case 5: Reset behavior
    nvdla_core_rstn = 0;
    #10;
    if (chn_b_rsci_biwt !== 0 || chn_b_rsci_bdwt !== 0 || chn_b_rsci_ld_core_sct !== 0) begin
      $display("FAIL: Reset behavior failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule