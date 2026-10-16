`timescale 1ns/1ps

module tb_NV_NVDLA_CACC_delivery_ctrl;

  reg nvdla_core_clk;
  reg nvdla_core_rstn;
  reg cacc2sdp_ready;
  reg cacc2sdp_valid;
  reg dbuf_rd_ready;
  reg [511:0] dlv_data_0;
  reg [511:0] dlv_data_1;
  reg [511:0] dlv_data_2;
  reg [511:0] dlv_data_3;
  reg [511:0] dlv_data_4;
  reg [511:0] dlv_data_5;
  reg [511:0] dlv_data_6;
  reg [511:0] dlv_data_7;
  reg [7:0] dlv_mask;
  reg [1:0] dlv_pd;
  reg dlv_valid;
  reg [4:0] reg2dp_batches;
  reg reg2dp_conv_mode;
  reg [26:0] reg2dp_dataout_addr;
  reg [12:0] reg2dp_dataout_channel;
  reg [12:0] reg2dp_dataout_height;
  reg [12:0] reg2dp_dataout_width;
  reg reg2dp_line_packed;
  reg [18:0] reg2dp_line_stride;
  reg reg2dp_op_en;
  reg [1:0] reg2dp_proc_precision;
  reg reg2dp_surf_packed;
  reg [18:0] reg2dp_surf_stride;
  reg wait_for_op_en;

  wire [2:0] accu2sc_credit_size;
  wire accu2sc_credit_vld;
  wire [4:0] dbuf_rd_addr;
  wire [7:0] dbuf_rd_en;
  wire dbuf_rd_layer_end;
  wire [4:0] dbuf_wr_addr_0;
  wire [4:0] dbuf_wr_addr_1;
  wire [4:0] dbuf_wr_addr_2;
  wire [4:0] dbuf_wr_addr_3;
  wire [4:0] dbuf_wr_addr_4;
  wire [4:0] dbuf_wr_addr_5;
  wire [4:0] dbuf_wr_addr_6;
  wire [4:0] dbuf_wr_addr_7;
  wire [511:0] dbuf_wr_data_0;
  wire [511:0] dbuf_wr_data_1;
  wire [511:0] dbuf_wr_data_2;
  wire [511:0] dbuf_wr_data_3;
  wire [511:0] dbuf_wr_data_4;
  wire [511:0] dbuf_wr_data_5;
  wire [511:0] dbuf_wr_data_6;
  wire [511:0] dbuf_wr_data_7;
  wire [7:0] dbuf_wr_en;
  wire dp2reg_done;

  NV_NVDLA_CACC_delivery_ctrl uut (
    .nvdla_core_clk(nvdla_core_clk),
    .nvdla_core_rstn(nvdla_core_rstn),
    .cacc2sdp_ready(cacc2sdp_ready),
    .cacc2sdp_valid(cacc2sdp_valid),
    .dbuf_rd_ready(dbuf_rd_ready),
    .dlv_data_0(dlv_data_0),
    .dlv_data_1(dlv_data_1),
    .dlv_data_2(dlv_data_2),
    .dlv_data_3(dlv_data_3),
    .dlv_data_4(dlv_data_4),
    .dlv_data_5(dlv_data_5),
    .dlv_data_6(dlv_data_6),
    .dlv_data_7(dlv_data_7),
    .dlv_mask(dlv_mask),
    .dlv_pd(dlv_pd),
    .dlv_valid(dlv_valid),
    .reg2dp_batches(reg2dp_batches),
    .reg2dp_conv_mode(reg2dp_conv_mode),
    .reg2dp_dataout_addr(reg2dp_dataout_addr),
    .reg2dp_dataout_channel(reg2dp_dataout_channel),
    .reg2dp_dataout_height(reg2dp_dataout_height),
    .reg2dp_dataout_width(reg2dp_dataout_width),
    .reg2dp_line_packed(reg2dp_line_packed),
    .reg2dp_line_stride(reg2dp_line_stride),
    .reg2dp_op_en(reg2dp_op_en),
    .reg2dp_proc_precision(reg2dp_proc_precision),
    .reg2dp_surf_packed(reg2dp_surf_packed),
    .reg2dp_surf_stride(reg2dp_surf_stride),
    .wait_for_op_en(wait_for_op_en),
    .accu2sc_credit_size(accu2sc_credit_size),
    .accu2sc_credit_vld(accu2sc_credit_vld),
    .dbuf_rd_addr(dbuf_rd_addr),
    .dbuf_rd_en(dbuf_rd_en),
    .dbuf_rd_layer_end(dbuf_rd_layer_end),
    .dbuf_wr_addr_0(dbuf_wr_addr_0),
    .dbuf_wr_addr_1(dbuf_wr_addr_1),
    .dbuf_wr_addr_2(dbuf_wr_addr_2),
    .dbuf_wr_addr_3(dbuf_wr_addr_3),
    .dbuf_wr_addr_4(dbuf_wr_addr_4),
    .dbuf_wr_addr_5(dbuf_wr_addr_5),
    .dbuf_wr_addr_6(dbuf_wr_addr_6),
    .dbuf_wr_addr_7(dbuf_wr_addr_7),
    .dbuf_wr_data_0(dbuf_wr_data_0),
    .dbuf_wr_data_1(dbuf_wr_data_1),
    .dbuf_wr_data_2(dbuf_wr_data_2),
    .dbuf_wr_data_3(dbuf_wr_data_3),
    .dbuf_wr_data_4(dbuf_wr_data_4),
    .dbuf_wr_data_5(dbuf_wr_data_5),
    .dbuf_wr_data_6(dbuf_wr_data_6),
    .dbuf_wr_data_7(dbuf_wr_data_7),
    .dbuf_wr_en(dbuf_wr_en),
    .dp2reg_done(dp2reg_done)
  );

  initial begin
    nvdla_core_clk = 0;
    nvdla_core_rstn = 0;
    cacc2sdp_ready = 0;
    cacc2sdp_valid = 0;
    dbuf_rd_ready = 0;
    dlv_data_0 = 512'h0;
    dlv_data_1 = 512'h1;
    dlv_data_2 = 512'h2;
    dlv_data_3 = 512'h3;
    dlv_data_4 = 512'h4;
    dlv_data_5 = 512'h5;
    dlv_data_6 = 512'h6;
    dlv_data_7 = 512'h7;
    dlv_mask = 8'hFF;
    dlv_pd = 2'b00;
    dlv_valid = 0;
    reg2dp_batches = 5'b00001;
    reg2dp_conv_mode = 1'b0;
    reg2dp_dataout_addr = 27'h0;
    reg2dp_dataout_channel = 13'h1;
    reg2dp_dataout_height = 13'h1;
    reg2dp_dataout_width = 13'h1;
    reg2dp_line_packed = 1'b0;
    reg2dp_line_stride = 19'h0;
    reg2dp_op_en = 1'b1;
    reg2dp_proc_precision = 2'b00;
    reg2dp_surf_packed = 1'b0;
    reg2dp_surf_stride = 19'h0;
    wait_for_op_en = 1'b1;

    #10 nvdla_core_rstn = 1;
    #10 cacc2sdp_ready = 1; cacc2sdp_valid = 1; dlv_valid = 1;

    #10 dlv_valid = 0; // Test case 1: Valid data delivery
    #10 dlv_valid = 1; // Test case 2: Valid data delivery again

    #10 cacc2sdp_valid = 0; // Test case 3: Validity check
    #10 cacc2sdp_valid = 1;

    #10 dbuf_rd_ready = 1; // Test read request
    #10 dbuf_rd_ready = 0;

    #10 $display("PASS");
    $finish;
  end

  always #5 nvdla_core_clk = ~nvdla_core_clk;

endmodule