`timescale 1ns/1ps

module tb_NV_NVDLA_CDP_HLS_ICVT_pipe_p2;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg [24:0] mul_lsb_dout;
  reg [24:0] mul_msb_dout;
  reg mul_outh_prdy;
  reg sub_outh_pvld;
  wire [24:0] mul_lsb_data_out;
  wire [24:0] mul_msb_data_out;
  wire mul_outh_pvld;
  wire sub_outh_prdy;

  // Instantiate the module under test
  NV_NVDLA_CDP_HLS_ICVT_pipe_p2 uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .mul_lsb_dout(mul_lsb_dout),
    .mul_msb_dout(mul_msb_dout),
    .mul_outh_prdy(mul_outh_prdy),
    .sub_outh_pvld(sub_outh_pvld),
    .mul_lsb_data_out(mul_lsb_data_out),
    .mul_msb_data_out(mul_msb_data_out),
    .mul_outh_pvld(mul_outh_pvld),
    .sub_outh_prdy(sub_outh_prdy)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk; // 10ns clock period
  end

  // Reset and stimulus
  initial begin
    nvdla_core_rstn = 0;
    mul_lsb_dout = 25'b0;
    mul_msb_dout = 25'b0;
    mul_outh_prdy = 1;
    sub_outh_pvld = 0;

    // Apply reset
    #10;
    nvdla_core_rstn = 1;

    // Test sequence
    #10;
    mul_lsb_dout = 25'h1A2B3C; // Set LSB
    mul_msb_dout = 25'h4D5E6F; // Set MSB
    sub_outh_pvld = 1; // Indicate valid data

    #10;
    if (mul_outh_pvld !== 1) begin
      $display("FAIL: mul_outh_pvld should be 1 when sub_outh_pvld is valid");
      $finish;
    end

    if (mul_lsb_data_out !== 25'h1A2B3C) begin
      $display("FAIL: mul_lsb_data_out mismatch");
      $finish;
    end

    if (mul_msb_data_out !== 25'h4D5E6F) begin
      $display("FAIL: mul_msb_data_out mismatch");
      $finish;
    end

    // Check ready signal
    #10;
    sub_outh_pvld = 0; // Indicate no valid data
    if (sub_outh_prdy !== 1) begin
      $display("FAIL: sub_outh_prdy should be 1 when no valid data is present");
      $finish;
    end

    // Finalize
    $display("PASS");
    $finish;
  end

endmodule