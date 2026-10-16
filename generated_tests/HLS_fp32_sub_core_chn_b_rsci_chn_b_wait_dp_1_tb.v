`timescale 1ns/1ps

module tb_HLS_fp32_sub_core_chn_b_rsci_chn_b_wait_dp;

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
  
  // Inputs for the module
  reg [31:0] input_0;
  reg [31:0] input_1;
  reg sel;
  reg _0;
  reg _1;

  // Instantiate the module under test
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
    input_0 = 32'h00000001;
    input_1 = 32'h00000002;
    sel = 0;
    _0 = 0;
    _1 = 0;

    // Wait for reset
    @(posedge nvdla_core_clk);
    
    // Test case 1: Check output when selecting input_0
    chn_b_rsci_d = input_0; // Set input to 1
    chn_b_rsci_oswt = 1; // Enable output
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_d_mxwt !== input_0) begin
      $display("FAIL: Test case 1 failed, expected %h but got %h", input_0, chn_b_rsci_d_mxwt);
      $finish;
    end

    // Test case 2: Check output when selecting input_1
    sel = 1; // Select input_1
    chn_b_rsci_d = input_1; // Set input to 2
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_d_mxwt !== input_1) begin
      $display("FAIL: Test case 2 failed, expected %h but got %h", input_1, chn_b_rsci_d_mxwt);
      $finish;
    end

    // Test case 3: Check behavior with buffered value
    chn_b_rsci_biwt = 1; // Set buffered input
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_d_mxwt !== input_1) begin
      $display("FAIL: Test case 3 failed, expected %h but got %h", input_1, chn_b_rsci_d_mxwt);
      $finish;
    end

    // Test case 4: Check write enable
    chn_b_rsci_bdwt = 1; // Set buffered data write
    @(posedge nvdla_core_clk);
    if (chn_b_rsci_wen_comp !== 1) begin
      $display("FAIL: Test case 4 failed, expected write enable to be 1 but got %b", chn_b_rsci_wen_comp);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule