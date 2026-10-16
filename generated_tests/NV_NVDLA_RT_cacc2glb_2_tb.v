`timescale 1ns/1ps

module tb_NV_NVDLA_RT_cacc2glb;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [1:0] cacc2glb_done_intr_src_pd;
  wire [1:0] cacc2glb_done_intr_dst_pd;

  // Instantiate the module under test (uut)
  NV_NVDLA_RT_cacc2glb uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .cacc2glb_done_intr_src_pd(cacc2glb_done_intr_src_pd),
    .cacc2glb_done_intr_dst_pd(cacc2glb_done_intr_dst_pd)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus generation
  initial begin
    nvdla_core_rstn = 0; // Assert reset
    cacc2glb_done_intr_src_pd = 2'b00; // Initial value
    #15; // Wait for some time
    nvdla_core_rstn = 1; // Deassert reset

    // Test sequence
    // Test case 1: Check reset behavior
    #10;
    if (cacc2glb_done_intr_dst_pd !== 2'b00) begin
      $display("FAIL: Initial output after reset is not zero");
      $finish;
    end

    // Test case 2: Check propagation of input
    cacc2glb_done_intr_src_pd = 2'b01; // Change input
    #10;
    if (cacc2glb_done_intr_dst_pd !== 2'b00) begin
      $display("FAIL: Output should still be zero (1 cycle delay)");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (cacc2glb_done_intr_dst_pd !== 2'b01) begin
      $display("FAIL: Output should be 01 after 2 cycles");
      $finish;
    end

    // Test case 3: Check another input value
    cacc2glb_done_intr_src_pd = 2'b10; // Change input
    #10;
    if (cacc2glb_done_intr_dst_pd !== 2'b01) begin
      $display("FAIL: Output should still be 01 (1 cycle delay)");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (cacc2glb_done_intr_dst_pd !== 2'b10) begin
      $display("FAIL: Output should be 10 after 2 cycles");
      $finish;
    end

    // Test case 4: Check another input value
    cacc2glb_done_intr_src_pd = 2'b11; // Change input
    #10;
    if (cacc2glb_done_intr_dst_pd !== 2'b10) begin
      $display("FAIL: Output should still be 10 (1 cycle delay)");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (cacc2glb_done_intr_dst_pd !== 2'b11) begin
      $display("FAIL: Output should be 11 after 2 cycles");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule