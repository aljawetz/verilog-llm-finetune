`timescale 1ns/1ps

module tb_HLS_fp17_to_fp32_core_chn_a_rsci;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_a_rsci_oswt;
  wire chn_a_rsci_bawt;
  wire chn_a_rsci_wen_comp;
  wire [16:0] chn_a_rsci_d_mxwt;
  reg chn_a_rsci_biwt;
  reg chn_a_rsci_bdwt;
  reg [16:0] chn_a_rsci_d;
  
  // Inputs for the multiplexer
  reg [16:0] input_0;
  reg [16:0] input_1;
  reg sel;
  reg _0;
  reg _1;

  // Instantiate the module under test
  HLS_fp17_to_fp32_core_chn_a_rsci_chn_a_wait_dp uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .chn_a_rsci_oswt(chn_a_rsci_oswt),
    .chn_a_rsci_bawt(chn_a_rsci_bawt),
    .chn_a_rsci_wen_comp(chn_a_rsci_wen_comp),
    .chn_a_rsci_d_mxwt(chn_a_rsci_d_mxwt),
    .chn_a_rsci_biwt(chn_a_rsci_biwt),
    .chn_a_rsci_bdwt(chn_a_rsci_bdwt),
    .chn_a_rsci_d(chn_a_rsci_d)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Reset the DUT
    nvdla_core_rstn = 0;
    chn_a_rsci_oswt = 0;
    chn_a_rsci_biwt = 0;
    chn_a_rsci_bdwt = 0;
    chn_a_rsci_d = 17'b0;
    input_0 = 17'b00000000000000000; // 0
    input_1 = 17'b00000000000000001; // 1
    sel = 0;
    #10; // Wait for reset to take effect
    nvdla_core_rstn = 1;

    // Test case 1: Select input_0
    chn_a_rsci_oswt = 1;
    chn_a_rsci_d = input_0;
    #10;
    if (chn_a_rsci_d_mxwt !== input_0) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", input_0, chn_a_rsci_d_mxwt);
      $finish;
    end

    // Test case 2: Select input_1
    sel = 1;
    chn_a_rsci_d = input_1;
    #10;
    if (chn_a_rsci_d_mxwt !== input_1) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", input_1, chn_a_rsci_d_mxwt);
      $finish;
    end

    // Test case 3: Check write enable
    chn_a_rsci_biwt = 1;
    #10;
    if (chn_a_rsci_wen_comp !== 1) begin
      $display("FAIL: Test case 3 failed, expected write enable to be 1 but got %b", chn_a_rsci_wen_comp);
      $finish;
    end

    // Test case 4: Check bawt signal
    chn_a_rsci_bdwt = 1;
    #10;
    if (chn_a_rsci_bawt !== 1) begin
      $display("FAIL: Test case 4 failed, expected bawt to be 1 but got %b", chn_a_rsci_bawt);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule