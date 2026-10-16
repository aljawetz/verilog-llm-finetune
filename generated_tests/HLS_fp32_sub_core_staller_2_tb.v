`timescale 1ns/1ps

module tb_HLS_fp32_sub_core_staller;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg chn_a_rsci_wen_comp;
  reg chn_b_rsci_wen_comp;
  reg chn_o_rsci_wen_comp;
  wire core_wen;
  wire core_wten;

  // Instantiate the Unit Under Test (UUT)
  HLS_fp32_sub_core_staller uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .core_wen(core_wen),
    .chn_a_rsci_wen_comp(chn_a_rsci_wen_comp),
    .core_wten(core_wten),
    .chn_b_rsci_wen_comp(chn_b_rsci_wen_comp),
    .chn_o_rsci_wen_comp(chn_o_rsci_wen_comp)
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
    chn_a_rsci_wen_comp = 0;
    chn_b_rsci_wen_comp = 0;
    chn_o_rsci_wen_comp = 0;

    // Release reset
    #10;
    nvdla_core_rstn = 1;

    // Test case 1: All inputs low
    #10;
    if (core_wen !== 0 || core_wten !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: One input high
    chn_a_rsci_wen_comp = 1;
    #10;
    if (core_wen !== 0 || core_wten !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Two inputs high
    chn_b_rsci_wen_comp = 1;
    #10;
    if (core_wen !== 0 || core_wten !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: All inputs high
    chn_o_rsci_wen_comp = 1;
    #10;
    if (core_wen !== 1 || core_wten !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Reset the module
    nvdla_core_rstn = 0;
    #10;
    if (core_wten !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Release reset and check again
    nvdla_core_rstn = 1;
    #10;
    chn_a_rsci_wen_comp = 1;
    chn_b_rsci_wen_comp = 1;
    chn_o_rsci_wen_comp = 1;
    #10;
    if (core_wen !== 1 || core_wten !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule