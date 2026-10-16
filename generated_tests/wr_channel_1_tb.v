`timescale 1ns/1ps

module tb_wr_channel;

  reg clk;
  reg reset_n;
  wire rd_ip_fifo_0, rd_axi_conv_fifo_0;
  reg axi_conv_fifo_empty_0;
  reg [96:0] axi_conv_fifo_wrdata_0;
  reg [511:0] ip_wr_data_0;
  wire rd_ip_fifo_1, rd_axi_conv_fifo_1;
  reg axi_conv_fifo_empty_1;
  reg [96:0] axi_conv_fifo_wrdata_1;
  reg [511:0] ip_wr_data_1;
  wire rd_ip_fifo_2, rd_axi_conv_fifo_2;
  reg axi_conv_fifo_empty_2;
  reg [96:0] axi_conv_fifo_wrdata_2;
  reg [511:0] ip_wr_data_2;
  wire rd_ip_fifo_3, rd_axi_conv_fifo_3;
  reg axi_conv_fifo_empty_3;
  reg [96:0] axi_conv_fifo_wrdata_3;
  reg [511:0] ip_wr_data_3;
  wire rd_ip_fifo_4, rd_axi_conv_fifo_4;
  reg axi_conv_fifo_empty_4;
  reg [96:0] axi_conv_fifo_wrdata_4;
  reg [511:0] ip_wr_data_4;
  wire rd_ip_fifo_5, rd_axi_conv_fifo_5;
  reg axi_conv_fifo_empty_5;
  reg [96:0] axi_conv_fifo_wrdata_5;
  reg [511:0] ip_wr_data_5;
  wire rd_ip_fifo_6, rd_axi_conv_fifo_6;
  reg axi_conv_fifo_empty_6;
  reg [96:0] axi_conv_fifo_wrdata_6;
  reg [511:0] ip_wr_data_6;
  wire rd_ip_fifo_7, rd_axi_conv_fifo_7;
  reg axi_conv_fifo_empty_7;
  reg [96:0] axi_conv_fifo_wrdata_7;
  reg [511:0] ip_wr_data_7;

  reg [1:0] vcid_vc0, vcid_vc1;
  reg [63:0] tr_base_addr_vc0, tr_base_addr_vc1;
  reg processing_vc0, processing_vc1;
  reg wready;
  wire wvalid;
  wire [63:0] wstrb;
  wire [511:0] wdata;
  wire wlast;
  wire [7:0] wid;
  reg bvalid;
  reg [1:0] bresp;
  wire bready;

  wr_channel uut (
    .clk(clk),
    .reset_n(reset_n),
    .rd_ip_fifo_0(rd_ip_fifo_0),
    .axi_conv_fifo_empty_0(axi_conv_fifo_empty_0),
    .axi_conv_fifo_wrdata_0(axi_conv_fifo_wrdata_0),
    .rd_axi_conv_fifo_0(rd_axi_conv_fifo_0),
    .ip_wr_data_0(ip_wr_data_0),
    .rd_ip_fifo_1(rd_ip_fifo_1),
    .axi_conv_fifo_empty_1(axi_conv_fifo_empty_1),
    .axi_conv_fifo_wrdata_1(axi_conv_fifo_wrdata_1),
    .rd_axi_conv_fifo_1(rd_axi_conv_fifo_1),
    .ip_wr_data_1(ip_wr_data_1),
    .rd_ip_fifo_2(rd_ip_fifo_2),
    .axi_conv_fifo_empty_2(axi_conv_fifo_empty_2),
    .axi_conv_fifo_wrdata_2(axi_conv_fifo_wrdata_2),
    .rd_axi_conv_fifo_2(rd_axi_conv_fifo_2),
    .ip_wr_data_2(ip_wr_data_2),
    .rd_ip_fifo_3(rd_ip_fifo_3),
    .axi_conv_fifo_empty_3(axi_conv_fifo_empty_3),
    .axi_conv_fifo_wrdata_3(axi_conv_fifo_wrdata_3),
    .rd_axi_conv_fifo_3(rd_axi_conv_fifo_3),
    .ip_wr_data_3(ip_wr_data_3),
    .rd_ip_fifo_4(rd_ip_fifo_4),
    .axi_conv_fifo_empty_4(axi_conv_fifo_empty_4),
    .axi_conv_fifo_wrdata_4(axi_conv_fifo_wrdata_4),
    .rd_axi_conv_fifo_4(rd_axi_conv_fifo_4),
    .ip_wr_data_4(ip_wr_data_4),
    .rd_ip_fifo_5(rd_ip_fifo_5),
    .axi_conv_fifo_empty_5(axi_conv_fifo_empty_5),
    .axi_conv_fifo_wrdata_5(axi_conv_fifo_wrdata_5),
    .rd_axi_conv_fifo_5(rd_axi_conv_fifo_5),
    .ip_wr_data_5(ip_wr_data_5),
    .rd_ip_fifo_6(rd_ip_fifo_6),
    .axi_conv_fifo_empty_6(axi_conv_fifo_empty_6),
    .axi_conv_fifo_wrdata_6(axi_conv_fifo_wrdata_6),
    .rd_axi_conv_fifo_6(rd_axi_conv_fifo_6),
    .ip_wr_data_6(ip_wr_data_6),
    .rd_ip_fifo_7(rd_ip_fifo_7),
    .axi_conv_fifo_empty_7(axi_conv_fifo_empty_7),
    .axi_conv_fifo_wrdata_7(axi_conv_fifo_wrdata_7),
    .rd_axi_conv_fifo_7(rd_axi_conv_fifo_7),
    .ip_wr_data_7(ip_wr_data_7),
    .vcid_vc0(vcid_vc0),
    .tr_base_addr_vc0(tr_base_addr_vc0),
    .processing_vc0(processing_vc0),
    .vcid_vc1(vcid_vc1),
    .tr_base_addr_vc1(tr_base_addr_vc1),
    .processing_vc1(processing_vc1),
    .wready(wready),
    .wvalid(wvalid),
    .wstrb(wstrb),
    .wdata(wdata),
    .wlast(wlast),
    .wid(wid),
    .bvalid(bvalid),
    .bresp(bresp),
    .bready(bready)
  );

  initial begin
    clk = 0;
    reset_n = 0;
    axi_conv_fifo_empty_0 = 1;
    axi_conv_fifo_empty_1 = 1;
    axi_conv_fifo_empty_2 = 1;
    axi_conv_fifo_empty_3 = 1;
    axi_conv_fifo_empty_4 = 1;
    axi_conv_fifo_empty_5 = 1;
    axi_conv_fifo_empty_6 = 1;
    axi_conv_fifo_empty_7 = 1;
    bvalid = 0;
    wready = 0;
    processing_vc0 = 0;
    processing_vc1 = 0;
    vcid_vc0 = 2'b00;
    vcid_vc1 = 2'b01;
    tr_base_addr_vc0 = 64'h0;
    tr_base_addr_vc1 = 64'h0;

    #5 reset_n = 1; // Release reset

    // Test case 1: Write data to FIFO 0
    axi_conv_fifo_empty_0 = 0;
    axi_conv_fifo_wrdata_0 = 97'h1; // Example data
    ip_wr_data_0 = 512'hA; // Example data
    #10;

    // Simulate wready signal
    wready = 1;
    #10;

    // Check if rd_ip_fifo_0 is asserted
    if (!rd_ip_fifo_0) begin
      $display("FAIL: rd_ip_fifo_0 should be asserted");
      $finish;
    end

    // Test case 2: Write data to FIFO 1
    axi_conv_fifo_empty_1 = 0;
    axi_conv_fifo_wrdata_1 = 97'h2; // Example data
    ip_wr_data_1 = 512'hB; // Example data
    #10;

    // Simulate wready signal
    wready = 1;
    #10;

    // Check if rd_ip_fifo_1 is asserted
    if (!rd_ip_fifo_1) begin
      $display("FAIL: rd_ip_fifo_1 should be asserted");
      $finish;
    end

    // Test case 3: Write data to FIFO 2
    axi_conv_fifo_empty_2 = 0;
    axi_conv_fifo_wrdata_2 = 97'h3; // Example data
    ip_wr_data_2 = 512'hC; // Example data
    #10;

    // Simulate wready signal
    wready = 1;
    #10;

    // Check if rd_ip_fifo_2 is asserted
    if (!rd_ip_fifo_2) begin
      $display("FAIL: rd_ip_fifo_2 should be asserted");
      $finish;
    end

    // Complete the test
    $display("PASS");
    $finish;
  end

  always #5 clk = ~clk; // Clock generation

endmodule