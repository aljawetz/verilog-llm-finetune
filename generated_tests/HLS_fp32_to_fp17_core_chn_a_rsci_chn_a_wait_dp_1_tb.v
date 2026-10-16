`timescale 1ns/1ps

module tb_HLS_fp32_to_fp17_core_chn_a_rsci_chn_a_wait_dp;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_a_rsci_oswt;
  wire chn_a_rsci_bawt;
  wire chn_a_rsci_wen_comp;
  wire [31:0] chn_a_rsci_d_mxwt;
  reg chn_a_rsci_biwt;
  reg chn_a_rsci_bdwt;
  reg [31:0] chn_a_rsci_d;
  
  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_to_fp17_core_chn_a_rsci_chn_a_wait_dp uut (
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

  // Reset and test sequence
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    chn_a_rsci_oswt = 0;
    chn_a_rsci_biwt = 0;
    chn_a_rsci_bdwt = 0;
    chn_a_rsci_d = 32'h0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Check output when oswt is low
    chn_a_rsci_d = 32'hA5A5A5A5; // Input data
    chn_a_rsci_oswt = 0; // No overwrite
    #10;
    if (chn_a_rsci_d_mxwt !== 32'hA5A5A5A5) begin
      $display("FAIL: Test case 1 failed, expected 0xA5A5A5A5, got 0x%h", chn_a_rsci_d_mxwt);
      $finish;
    end

    // Test case 2: Check output when oswt is high
    chn_a_rsci_oswt = 1; // Allow overwrite
    chn_a_rsci_d = 32'h5A5A5A5A; // New input data
    #10;
    if (chn_a_rsci_d_mxwt !== 32'h5A5A5A5A) begin
      $display("FAIL: Test case 2 failed, expected 0x5A5A5A5A, got 0x%h", chn_a_rsci_d_mxwt);
      $finish;
    end

    // Test case 3: Check handshake signals
    chn_a_rsci_biwt = 1; // Simulate input ready
    #10;
    if (chn_a_rsci_bawt !== 1) begin
      $display("FAIL: Test case 3 failed, expected bawt to be 1, got %b", chn_a_rsci_bawt);
      $finish;
    end

    // Test case 4: Check wen_comp signal
    #10;
    if (chn_a_rsci_wen_comp !== 1) begin
      $display("FAIL: Test case 4 failed, expected wen_comp to be 1, got %b", chn_a_rsci_wen_comp);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule