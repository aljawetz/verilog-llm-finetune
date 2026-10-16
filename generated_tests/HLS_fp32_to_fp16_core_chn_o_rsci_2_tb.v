`timescale 1ns/1ps

module tb_HLS_fp32_to_fp16_core_chn_o_rsci;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_o_rsci_oswt;
  wire chn_o_rsci_bawt;
  wire chn_o_rsci_wen_comp;
  reg chn_o_rsci_biwt;
  reg chn_o_rsci_bdwt;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_to_fp16_core_chn_o_rsci_chn_o_wait_dp uut (
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

    // Test case 1: Check initial state after reset
    #10;
    if (chn_o_rsci_bawt !== 0 || chn_o_rsci_wen_comp !== 1) begin
      $display("FAIL: Initial state after reset is incorrect");
      $finish;
    end

    // Test case 2: Set chn_o_rsci_oswt and check outputs
    #10;
    chn_o_rsci_oswt = 1;
    #10;
    if (chn_o_rsci_wen_comp !== 0) begin
      $display("FAIL: wen_comp should be 0 when oswt is 1");
      $finish;
    end

    // Test case 3: Clear oswt and check outputs
    #10;
    chn_o_rsci_oswt = 0;
    #10;
    if (chn_o_rsci_wen_comp !== 1) begin
      $display("FAIL: wen_comp should be 1 when oswt is 0");
      $finish;
    end

    // Test case 4: Test with biwt and bdwt
    #10;
    chn_o_rsci_biwt = 1; // Set biwt
    #10;
    if (chn_o_rsci_bawt !== 1) begin
      $display("FAIL: bawt should be 1 when biwt is 1");
      $finish;
    end

    // Test case 5: Test bdwt influence
    #10;
    chn_o_rsci_bdwt = 1; // Set bdwt
    #10;
    if (uut.chn_o_rsci_bcwt !== 0) begin
      $display("FAIL: bcwt should be 0 when bdwt is 1");
      $finish;
    end

    // Test case 6: Clear bdwt and check bcwt
    #10;
    chn_o_rsci_bdwt = 0; // Clear bdwt
    #10;
    if (uut.chn_o_rsci_bcwt !== 1) begin
      $display("FAIL: bcwt should be 1 when bdwt is 0 and biwt is 1");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end

endmodule