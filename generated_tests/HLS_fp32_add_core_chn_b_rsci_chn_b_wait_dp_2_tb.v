`timescale 1ns/1ps

module tb_HLS_fp32_add_core_chn_b_rsci_chn_b_wait_dp;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_b_rsci_oswt;
  wire chn_b_rsci_bawt;
  wire chn_b_rsci_wen_comp;
  wire [31:0] chn_b_rsci_d_mxwt;
  reg chn_b_rsci_biwt;
  reg chn_b_rsci_bdwt;
  reg [31:0] chn_b_rsci_d;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_add_core_chn_b_rsci_chn_b_wait_dp uut (
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
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    chn_b_rsci_oswt = 0;
    chn_b_rsci_biwt = 0;
    chn_b_rsci_bdwt = 0;
    chn_b_rsci_d = 32'h00000000;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Normal operation with data
    chn_b_rsci_d = 32'hA5A5A5A5; // Input data
    chn_b_rsci_oswt = 0; // No overwrite
    #10;

    // Check outputs
    if (chn_b_rsci_d_mxwt !== 32'hA5A5A5A5) begin
      $display("FAIL: Test case 1 failed, expected %h, got %h", 32'hA5A5A5A5, chn_b_rsci_d_mxwt);
      $finish;
    end

    // Test case 2: Overwrite data
    chn_b_rsci_oswt = 1; // Enable overwrite
    chn_b_rsci_d = 32'h5A5A5A5A; // New input data
    #10;

    // Check outputs
    if (chn_b_rsci_d_mxwt !== 32'h5A5A5A5A) begin
      $display("FAIL: Test case 2 failed, expected %h, got %h", 32'h5A5A5A5A, chn_b_rsci_d_mxwt);
      $finish;
    end

    // Test case 3: Check wen_comp signal
    chn_b_rsci_biwt = 1; // Set biwt
    #10;

    // Check outputs
    if (chn_b_rsci_wen_comp !== 1) begin
      $display("FAIL: Test case 3 failed, expected wen_comp to be 1, got %b", chn_b_rsci_wen_comp);
      $finish;
    end

    // Test case 4: Check bawt signal
    chn_b_rsci_bdwt = 1; // Set bdwt
    #10;

    // Check outputs
    if (chn_b_rsci_bawt !== 1) begin
      $display("FAIL: Test case 4 failed, expected bawt to be 1, got %b", chn_b_rsci_bawt);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule