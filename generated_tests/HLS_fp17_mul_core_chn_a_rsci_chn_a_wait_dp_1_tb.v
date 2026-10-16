`timescale 1ns/1ps

module tb_HLS_fp17_mul_core_chn_a_rsci_chn_a_wait_dp;

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

  // Instantiate the Unit Under Test (UUT)
  HLS_fp17_mul_core_chn_a_rsci_chn_a_wait_dp uut (
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
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 100MHz clock
  end

  // Reset and stimulus
  initial begin
    // Initialize inputs
    nvdla_core_rstn = 0;
    chn_a_rsci_oswt = 0;
    chn_a_rsci_biwt = 0;
    chn_a_rsci_bdwt = 0;
    chn_a_rsci_d = 17'b0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: Normal operation
    chn_a_rsci_d = 17'b00000000000000001; // Input data
    chn_a_rsci_oswt = 1; // Enable output
    #10;

    if (chn_a_rsci_d_mxwt !== 17'b00000000000000001) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", 17'b00000000000000001, chn_a_rsci_d_mxwt);
      $finish;
    end

    // Test case 2: Change input data
    chn_a_rsci_d = 17'b00000000000000010; // New input data
    #10;

    if (chn_a_rsci_d_mxwt !== 17'b00000000000000010) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", 17'b00000000000000010, chn_a_rsci_d_mxwt);
      $finish;
    end

    // Test case 3: Test handshaking
    chn_a_rsci_biwt = 1; // Simulate a back write
    #10;

    if (chn_a_rsci_bawt !== 1) begin
      $display("FAIL: Test case 3 failed, expected bawt to be 1, got %b", chn_a_rsci_bawt);
      $finish;
    end

    // Test case 4: Test oswt deactivation
    chn_a_rsci_oswt = 0; // Disable output
    #10;

    if (chn_a_rsci_d_mxwt !== 17'b00000000000000010) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", 17'b00000000000000010, chn_a_rsci_d_mxwt);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule