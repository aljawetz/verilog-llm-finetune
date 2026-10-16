`timescale 1ns/1ps

module tb_HLS_fp17_mul_core_chn_b_rsci;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_b_rsci_oswt;
  wire chn_b_rsci_bawt;
  wire chn_b_rsci_wen_comp;
  wire [16:0] chn_b_rsci_d_mxwt;
  reg chn_b_rsci_biwt;
  reg chn_b_rsci_bdwt;
  reg [16:0] chn_b_rsci_d;
  reg [16:0] input_0;
  reg [16:0] input_1;
  reg sel;
  reg _0;
  reg _1;

  // Instantiate the module under test (uut)
  HLS_fp17_mul_core_chn_b_rsci_chn_b_wait_dp uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .chn_b_rsci_oswt(chn_b_rsci_oswt),
    .chn_b_rsci_bawt(chn_b_rsci_bawt),
    .chn_b_rsci_wen_comp(chn_b_rsci_wen_comp),
    .chn_b_rsci_d_mxwt(chn_b_rsci_d_mxwt),
    .chn_b_rsci_biwt(chn_b_rsci_biwt),
    .chn_b_rsci_bdwt(chn_b_rsci_bdwt),
    .chn_b_rsci_d(chn_b_rsci_d)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    nvdla_core_rstn = 0;
    chn_b_rsci_oswt = 0;
    chn_b_rsci_biwt = 0;
    chn_b_rsci_bdwt = 0;
    chn_b_rsci_d = 17'b0;
    input_0 = 17'b00000000000000000;
    input_1 = 17'b00000000000000001;
    sel = 0;
    _0 = 0;
    _1 = 0;

    // Release reset
    #10 nvdla_core_rstn = 1;

    // Test case 1: Check initial state
    #10;
    if (chn_b_rsci_d_mxwt !== 17'b0) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test case 2: Test with input_0 selected
    chn_b_rsci_d = input_0;
    sel = 0;
    #10;
    if (chn_b_rsci_d_mxwt !== input_0) begin
      $display("FAIL: MUX output with input_0 failed");
      $finish;
    end

    // Test case 3: Test with input_1 selected
    chn_b_rsci_d = input_1;
    sel = 1;
    #10;
    if (chn_b_rsci_d_mxwt !== input_1) begin
      $display("FAIL: MUX output with input_1 failed");
      $finish;
    end

    // Test case 4: Test handshaking mechanism
    chn_b_rsci_biwt = 1;
    chn_b_rsci_bdwt = 0;
    #10;
    if (chn_b_rsci_bawt !== 1) begin
      $display("FAIL: Handshake output check failed");
      $finish;
    end

    // Test case 5: Test output when oswt is asserted
    chn_b_rsci_oswt = 1;
    #10;
    if (chn_b_rsci_wen_comp !== 1) begin
      $display("FAIL: Write enable composite check failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule