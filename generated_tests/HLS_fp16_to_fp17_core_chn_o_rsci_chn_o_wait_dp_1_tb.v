`timescale 1ns/1ps

module tb_HLS_fp16_to_fp17_core_chn_o_rsci_chn_o_wait_dp;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_o_rsci_oswt;
  reg chn_o_rsci_biwt;
  reg chn_o_rsci_bdwt;
  wire chn_o_rsci_bawt;
  wire chn_o_rsci_wen_comp;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp16_to_fp17_core_chn_o_rsci_chn_o_wait_dp uut (
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
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
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

    // Test case 1: Check outputs with oswt = 0
    chn_o_rsci_oswt = 0;
    chn_o_rsci_biwt = 1;
    chn_o_rsci_bdwt = 0;
    #10;

    if (chn_o_rsci_bawt !== 1'b1 || chn_o_rsci_wen_comp !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Check outputs with oswt = 1
    chn_o_rsci_oswt = 1;
    chn_o_rsci_biwt = 0;
    chn_o_rsci_bdwt = 1;
    #10;

    if (chn_o_rsci_bawt !== 0 || chn_o_rsci_wen_comp !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Check outputs with oswt = 0 and bdwt = 1
    chn_o_rsci_oswt = 0;
    chn_o_rsci_biwt = 1;
    chn_o_rsci_bdwt = 1;
    #10;

    if (chn_o_rsci_bawt !== 1'b1 || chn_o_rsci_wen_comp !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Check reset functionality
    nvdla_core_rstn = 0;
    #10;

    if (uut.chn_o_rsci_bcwt !== 1'b0) begin
      $display("FAIL: Reset functionality failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule