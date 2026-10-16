`timescale 1ns/1ps

module tb_NV_NVDLA_RUBIK_seq_gen;

  // Parameters
  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg dp2reg_consumer;
  reg reg2dp_perf_en;
  reg reg2dp_op_en;
  reg reg2dp_datain_ram_type;
  reg [1:0] reg2dp_rubik_mode;
  reg [1:0] reg2dp_in_precision;
  reg [31:0] reg2dp_dain_addr_high;
  reg [26:0] reg2dp_dain_addr_low;
  reg [12:0] reg2dp_datain_channel;
  reg [12:0] reg2dp_datain_height;
  reg [12:0] reg2dp_datain_width;
  reg [4:0] reg2dp_deconv_x_stride;
  reg [4:0] reg2dp_deconv_y_stride;
  reg [26:0] reg2dp_dain_line_stride;
  reg [26:0] reg2dp_dain_planar_stride;
  reg [26:0] reg2dp_dain_surf_stride;
  reg [26:0] reg2dp_contract_stride_0;
  reg [26:0] reg2dp_contract_stride_1;
  reg [31:0] reg2dp_daout_addr_high;
  reg [26:0] reg2dp_daout_addr_low;
  reg [26:0] reg2dp_daout_line_stride;
  reg [26:0] reg2dp_daout_planar_stride;
  reg [26:0] reg2dp_daout_surf_stride;
  reg [12:0] reg2dp_dataout_channel;
  reg dp2reg_done;
  reg rd_req_rdy;
  wire rd_req_type;
  wire rd_req_vld;
  wire [78:0] rd_req_pd;
  wire rf_wr_cmd_vld;
  wire [10:0] rf_wr_cmd_pd;
  wire rf_rd_cmd_vld;
  wire [11:0] rf_rd_cmd_pd;
  wire dma_wr_cmd_vld;
  wire [77:0] dma_wr_cmd_pd;
  wire contract_lit_dx;
  wire [13:0] inwidth;
  wire [31:0] dp2reg_d0_rd_stall_cnt;
  wire [31:0] dp2reg_d1_rd_stall_cnt;

  // Instantiate the Unit Under Test (UUT)
  NV_NVDLA_RUBIK_seq_gen uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .dp2reg_consumer(dp2reg_consumer),
    .reg2dp_perf_en(reg2dp_perf_en),
    .dp2reg_d0_rd_stall_cnt(dp2reg_d0_rd_stall_cnt),
    .dp2reg_d1_rd_stall_cnt(dp2reg_d1_rd_stall_cnt),
    .reg2dp_op_en(reg2dp_op_en),
    .reg2dp_datain_ram_type(reg2dp_datain_ram_type),
    .reg2dp_rubik_mode(reg2dp_rubik_mode),
    .reg2dp_in_precision(reg2dp_in_precision),
    .reg2dp_dain_addr_high(reg2dp_dain_addr_high),
    .reg2dp_dain_addr_low(reg2dp_dain_addr_low),
    .reg2dp_datain_channel(reg2dp_datain_channel),
    .reg2dp_datain_height(reg2dp_datain_height),
    .reg2dp_datain_width(reg2dp_datain_width),
    .reg2dp_deconv_x_stride(reg2dp_deconv_x_stride),
    .reg2dp_deconv_y_stride(reg2dp_deconv_y_stride),
    .reg2dp_dain_line_stride(reg2dp_dain_line_stride),
    .reg2dp_dain_planar_stride(reg2dp_dain_planar_stride),
    .reg2dp_dain_surf_stride(reg2dp_dain_surf_stride),
    .reg2dp_contract_stride_0(reg2dp_contract_stride_0),
    .reg2dp_contract_stride_1(reg2dp_contract_stride_1),
    .reg2dp_daout_addr_high(reg2dp_daout_addr_high),
    .reg2dp_daout_addr_low(reg2dp_daout_addr_low),
    .reg2dp_daout_line_stride(reg2dp_daout_line_stride),
    .reg2dp_daout_planar_stride(reg2dp_daout_planar_stride),
    .reg2dp_daout_surf_stride(reg2dp_daout_surf_stride),
    .reg2dp_dataout_channel(reg2dp_dataout_channel),
    .dp2reg_done(dp2reg_done),
    .rd_req_rdy(rd_req_rdy),
    .rd_req_type(rd_req_type),
    .rd_req_vld(rd_req_vld),
    .rd_req_pd(rd_req_pd),
    .rf_wr_cmd_vld(rf_wr_cmd_vld),
    .rf_wr_cmd_pd(rf_wr_cmd_pd),
    .rf_rd_cmd_vld(rf_rd_cmd_vld),
    .rf_rd_cmd_pd(rf_rd_cmd_pd),
    .dma_wr_cmd_vld(dma_wr_cmd_vld),
    .dma_wr_cmd_pd(dma_wr_cmd_pd),
    .contract_lit_dx(contract_lit_dx),
    .inwidth(inwidth)
  );

  // Clock generation
  initial begin
    nvdla_core_clk = 0;
    forever #5 nvdla_core_clk = ~nvdla_core_clk;
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
    dp2reg_consumer = 0;
    reg2dp_perf_en = 1;
    reg2dp_op_en = 0;
    reg2dp_datain_ram_type = 0;
    reg2dp_rubik_mode = 2'b00; // Contract mode
    reg2dp_in_precision = 2'b00; // 8-bit
    reg2dp_dain_addr_high = 32'h00000000;
    reg2dp_dain_addr_low = 27'h0000000;
    reg2dp_datain_channel = 12'd1;
    reg2dp_datain_height = 12'd1;
    reg2dp_datain_width = 12'd1;
    reg2dp_deconv_x_stride = 5'd1;
    reg2dp_deconv_y_stride = 5'd1;
    reg2dp_dain_line_stride = 27'h0000000;
    reg2dp_dain_planar_stride = 27'h0000000;
    reg2dp_dain_surf_stride = 27'h0000000;
    reg2dp_contract_stride_0 = 27'h0000000;
    reg2dp_contract_stride_1 = 27'h0000000;
    reg2dp_daout_addr_high = 32'h00000000;
    reg2dp_daout_addr_low = 27'h0000000;
    reg2dp_daout_line_stride = 27'h0000000;
    reg2dp_daout_planar_stride = 27'h0000000;
    reg2dp_daout_surf_stride = 27'h0000000;
    reg2dp_dataout_channel = 12'd1;
    dp2reg_done = 0;
    rd_req_rdy = 1;

    // Start test
    #10;
    reg2dp_op_en = 1; // Start operation
    #10;
    dp2reg_done = 1; // Indicate operation done
    #10;

    // Check outputs
    if (dp2reg_d0_rd_stall_cnt !== 32'd0) begin
      $display("FAIL: dp2reg_d0_rd_stall_cnt is not zero");
      $finish;
    end

    if (dp2reg_d1_rd_stall_cnt !== 32'd0) begin
      $display("FAIL: dp2reg_d1_rd_stall_cnt is not zero");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule