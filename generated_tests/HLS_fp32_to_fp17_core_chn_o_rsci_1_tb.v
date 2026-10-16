`timescale 1ns/1ps

module tb_HLS_fp32_to_fp17_core_chn_o_rsci;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_o_rsci_oswt;
  wire chn_o_rsci_bawt;
  wire chn_o_rsci_wen_comp;
  reg chn_o_rsci_biwt;
  reg chn_o_rsci_bdwt;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_to_fp17_core_chn_o_rsci_chn_o_wait_dp uut (
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

  // Reset and stimulus generation
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    chn_o_rsci_oswt = 0;
    chn_o_rsci_biwt = 0;
    chn_o_rsci_bdwt = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1; // Release reset

    // Test sequence
    // Test case 1: Check initial state after reset
    #10;
    if (chn_o_rsci_bawt !== 0 || chn_o_rsci_wen_comp !== 1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test case 2: Assert chn_o_rsci_oswt and check outputs
    chn_o_rsci_oswt = 1;
    #10;
    if (chn_o_rsci_wen_comp !== 0) begin
      $display("FAIL: wen_comp should be 0 when oswt is asserted");
      $finish;
    end

    // Test case 3: Deassert chn_o_rsci_oswt and check outputs
    chn_o_rsci_oswt = 0;
    #10;
    if (chn_o_rsci_wen_comp !== 1) begin
      $display("FAIL: wen_comp should be 1 when oswt is deasserted");
      $finish;
    end

    // Test case 4: Test with biwt and bdwt
    chn_o_rsci_biwt = 1;
    chn_o_rsci_bdwt = 0;
    #10;
    if (chn_o_rsci_bawt !== 1) begin
      $display("FAIL: bawt should be 1 when biwt is asserted");
      $finish;
    end

    // Test case 5: Test bdwt influence
    chn_o_rsci_bdwt = 1;
    #10;
    if (uut.chn_o_rsci_bcwt !== 0) begin
      $display("FAIL: bcwt should be 0 when bdwt is asserted");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule