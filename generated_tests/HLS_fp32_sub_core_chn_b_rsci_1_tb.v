`timescale 1ns/1ps

module tb_HLS_fp32_sub_core_chn_b_rsci;

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
  HLS_fp32_sub_core_chn_b_rsci_chn_b_wait_dp uut (
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

  // Reset generation
  initial begin
    nvdla_core_rstn = 0;
    #10;
    nvdla_core_rstn = 1;
  end

  // Test sequence
  initial begin
    // Initialize inputs
    chn_b_rsci_oswt = 0;
    chn_b_rsci_biwt = 0;
    chn_b_rsci_bdwt = 0;
    chn_b_rsci_d = 32'h00000000;

    // Wait for reset
    @(posedge nvdla_core_clk);
    
    // Test case 1: Check initial state
    if (chn_b_rsci_bawt !== 0 || chn_b_rsci_wen_comp !== 1 || chn_b_rsci_d_mxwt !== 32'h00000000) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test case 2: Write data
    chn_b_rsci_d = 32'hDEADBEEF;
    chn_b_rsci_biwt = 1; // Enable input
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_d_mxwt !== 32'hDEADBEEF) begin
      $display("FAIL: Data write check failed");
      $finish;
    end

    // Test case 3: Disable input and check output
    chn_b_rsci_biwt = 0;
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_d_mxwt !== 32'hDEADBEEF) begin
      $display("FAIL: Data hold check failed");
      $finish;
    end

    // Test case 4: Enable oswt and check wen_comp
    chn_b_rsci_oswt = 1;
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_wen_comp !== 0) begin
      $display("FAIL: Write enable check failed");
      $finish;
    end

    // Test case 5: Test buffered data
    chn_b_rsci_bdwt = 1; // Enable buffered data
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_d_mxwt !== 32'hDEADBEEF) begin
      $display("FAIL: Buffered data check failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule