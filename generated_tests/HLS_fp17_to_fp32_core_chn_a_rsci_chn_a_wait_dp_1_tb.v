`timescale 1ns/1ps

module tb_HLS_fp17_to_fp32_core_chn_a_rsci_chn_a_wait_dp;

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

    // Test case 1: Basic operation
    chn_a_rsci_d = 17'b10101010101010101; // Input data
    chn_a_rsci_oswt = 1; // Enable output
    #10;

    if (chn_a_rsci_d_mxwt !== chn_a_rsci_d) begin
      $display("FAIL: MUX output mismatch on first test");
      $finish;
    end

    // Test case 2: Handshaking with biwt
    chn_a_rsci_biwt = 1; // Simulate a valid input
    #10;

    if (chn_a_rsci_bawt !== 1) begin
      $display("FAIL: Handshake signal chn_a_rsci_bawt not asserted");
      $finish;
    end

    // Test case 3: Check wen_comp signal
    chn_a_rsci_oswt = 0; // Disable output
    #10;

    if (chn_a_rsci_wen_comp !== 1) begin
      $display("FAIL: Write enable comparison signal mismatch");
      $finish;
    end

    // Test case 4: Check buffered data
    chn_a_rsci_bdwt = 1; // Simulate buffered data
    #10;

    if (uut.chn_a_rsci_d_bfwt !== chn_a_rsci_d) begin
      $display("FAIL: Buffered data mismatch");
      $finish;
    end

    // Test case 5: Reset behavior
    nvdla_core_rstn = 0; // Assert reset
    #10;
    if (uut.chn_a_rsci_bcwt !== 0 || uut.chn_a_rsci_d_bfwt !== 17'b0) begin
      $display("FAIL: Reset behavior not as expected");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule