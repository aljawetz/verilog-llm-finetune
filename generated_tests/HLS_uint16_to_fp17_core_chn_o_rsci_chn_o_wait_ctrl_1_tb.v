`timescale 1ns/1ps

module tb_HLS_uint16_to_fp17_core_chn_o_rsci_chn_o_wait_ctrl;

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
  HLS_uint16_to_fp17_core_chn_o_rsci_chn_o_wait_ctrl uut (
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
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    chn_o_rsci_oswt = 0;
    core_wen = 0;
    core_wten = 0;
    chn_o_rsci_iswt0 = 0;
    chn_o_rsci_ld_core_psct = 0;
    chn_o_rsci_vd = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    // Test sequence 1: Basic functionality
    chn_o_rsci_iswt0 = 1; // Enable input switch
    core_wten = 0; // Core write enable not active
    chn_o_rsci_vd = 1; // Valid data
    #10;

    if (uut.chn_o_rsci_biwt !== 1) begin
      $display("FAIL: Expected chn_o_rsci_biwt to be 1 when chn_o_rsci_iswt0 is 1 and chn_o_rsci_vd is 1");
      $finish;
    end

    // Test sequence 2: Check bi-directional wait signal
    core_wen = 1; // Activate core write enable
    chn_o_rsci_oswt = 1; // Enable output switch
    #10;

    if (uut.chn_o_rsci_bdwt !== 1) begin
      $display("FAIL: Expected chn_o_rsci_bdwt to be 1 when core_wen is 1 and chn_o_rsci_oswt is 1");
      $finish;
    end

    // Test sequence 3: Check internal state flip-flop
    chn_o_rsci_ld_core_psct = 1; // Load core state
    #10;

    if (uut.chn_o_rsci_ld_core_sct !== 1) begin
      $display("FAIL: Expected chn_o_rsci_ld_core_sct to be 1 when chn_o_rsci_ld_core_psct is 1 and chn_o_rsci_ogwt is 1");
      $finish;
    end

    // Test sequence 4: Reset behavior
    nvdla_core_rstn = 0; // Assert reset
    #10;
    nvdla_core_rstn = 1; // Release reset
    #10;

    if (uut.chn_o_rsci_icwt !== 0) begin
      $display("FAIL: Expected chn_o_rsci_icwt to be 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule