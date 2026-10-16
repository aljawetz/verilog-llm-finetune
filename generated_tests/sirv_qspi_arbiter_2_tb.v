`timescale 1ns/1ps

module tb_sirv_qspi_arbiter;

  reg clock;
  reg reset;
  wire io_inner_0_tx_ready;
  reg io_inner_0_tx_valid;
  reg [7:0] io_inner_0_tx_bits;
  wire io_inner_0_rx_valid;
  wire [7:0] io_inner_0_rx_bits;
  reg [7:0] io_inner_0_cnt;
  reg [1:0] io_inner_0_fmt_proto;
  reg io_inner_0_fmt_endian;
  reg io_inner_0_fmt_iodir;
  reg io_inner_0_cs_set;
  reg io_inner_0_cs_clear;
  reg io_inner_0_cs_hold;
  wire io_inner_0_active;
  reg io_inner_0_lock;
  
  wire io_inner_1_tx_ready;
  reg io_inner_1_tx_valid;
  reg [7:0] io_inner_1_tx_bits;
  wire io_inner_1_rx_valid;
  wire [7:0] io_inner_1_rx_bits;
  reg [7:0] io_inner_1_cnt;
  reg [1:0] io_inner_1_fmt_proto;
  reg io_inner_1_fmt_endian;
  reg io_inner_1_fmt_iodir;
  reg io_inner_1_cs_set;
  reg io_inner_1_cs_clear;
  reg io_inner_1_cs_hold;
  wire io_inner_1_active;
  reg io_inner_1_lock;
  
  reg io_outer_tx_ready;
  wire io_outer_tx_valid;
  wire [7:0] io_outer_tx_bits;
  reg io_outer_rx_valid;
  reg [7:0] io_outer_rx_bits;
  wire [7:0] io_outer_cnt;
  wire [1:0] io_outer_fmt_proto;
  wire io_outer_fmt_endian;
  wire io_outer_fmt_iodir;
  wire io_outer_cs_set;
  wire io_outer_cs_clear;
  wire io_outer_cs_hold;
  reg io_outer_active;
  reg io_sel;

  // Instantiate the module under test
  sirv_qspi_arbiter uut (
    .clock(clock),
    .reset(reset),
    .io_inner_0_tx_ready(io_inner_0_tx_ready),
    .io_inner_0_tx_valid(io_inner_0_tx_valid),
    .io_inner_0_tx_bits(io_inner_0_tx_bits),
    .io_inner_0_rx_valid(io_inner_0_rx_valid),
    .io_inner_0_rx_bits(io_inner_0_rx_bits),
    .io_inner_0_cnt(io_inner_0_cnt),
    .io_inner_0_fmt_proto(io_inner_0_fmt_proto),
    .io_inner_0_fmt_endian(io_inner_0_fmt_endian),
    .io_inner_0_fmt_iodir(io_inner_0_fmt_iodir),
    .io_inner_0_cs_set(io_inner_0_cs_set),
    .io_inner_0_cs_clear(io_inner_0_cs_clear),
    .io_inner_0_cs_hold(io_inner_0_cs_hold),
    .io_inner_0_active(io_inner_0_active),
    .io_inner_0_lock(io_inner_0_lock),
    .io_inner_1_tx_ready(io_inner_1_tx_ready),
    .io_inner_1_tx_valid(io_inner_1_tx_valid),
    .io_inner_1_tx_bits(io_inner_1_tx_bits),
    .io_inner_1_rx_valid(io_inner_1_rx_valid),
    .io_inner_1_rx_bits(io_inner_1_rx_bits),
    .io_inner_1_cnt(io_inner_1_cnt),
    .io_inner_1_fmt_proto(io_inner_1_fmt_proto),
    .io_inner_1_fmt_endian(io_inner_1_fmt_endian),
    .io_inner_1_fmt_iodir(io_inner_1_fmt_iodir),
    .io_inner_1_cs_set(io_inner_1_cs_set),
    .io_inner_1_cs_clear(io_inner_1_cs_clear),
    .io_inner_1_cs_hold(io_inner_1_cs_hold),
    .io_inner_1_active(io_inner_1_active),
    .io_inner_1_lock(io_inner_1_lock),
    .io_outer_tx_ready(io_outer_tx_ready),
    .io_outer_tx_valid(io_outer_tx_valid),
    .io_outer_tx_bits(io_outer_tx_bits),
    .io_outer_rx_valid(io_outer_rx_valid),
    .io_outer_rx_bits(io_outer_rx_bits),
    .io_outer_cnt(io_outer_cnt),
    .io_outer_fmt_proto(io_outer_fmt_proto),
    .io_outer_fmt_endian(io_outer_fmt_endian),
    .io_outer_fmt_iodir(io_outer_fmt_iodir),
    .io_outer_cs_set(io_outer_cs_set),
    .io_outer_cs_clear(io_outer_cs_clear),
    .io_outer_cs_hold(io_outer_cs_hold),
    .io_outer_active(io_outer_active),
    .io_sel(io_sel)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10 ns period
  end

  // Test sequence
  initial begin
    reset = 1;
    io_outer_tx_ready = 0;
    io_outer_rx_valid = 0;
    io_sel = 0;
    #10 reset = 0;

    // Test case 1: Check behavior with inner 0 selected
    io_inner_0_tx_valid = 1;
    io_inner_0_tx_bits = 8'hAA;
    io_inner_0_cnt = 8'h01;
    io_inner_0_fmt_proto = 2'b00;
    io_inner_0_fmt_endian = 1'b0;
    io_inner_0_fmt_iodir = 1'b0;
    io_inner_0_cs_set = 1;
    io_inner_0_cs_clear = 0;
    io_inner_0_cs_hold = 0;
    io_inner_0_lock = 0;
    io_outer_tx_ready = 1;
    io_sel = 0;
    #10;

    if (io_outer_tx_valid !== 1'b1) begin
      $display("FAIL: io_outer_tx_valid should be high when inner 0 is selected and valid");
      $finish;
    end

    if (io_outer_tx_bits !== 8'hAA) begin
      $display("FAIL: io_outer_tx_bits should be 0xAA when inner 0 is selected");
      $finish;
    end

    // Test case 2: Check behavior with inner 1 selected
    io_inner_1_tx_valid = 1;
    io_inner_1_tx_bits = 8'hBB;
    io_inner_1_cnt = 8'h02;
    io_inner_1_fmt_proto = 2'b01;
    io_inner_1_fmt_endian = 1'b1;
    io_inner_1_fmt_iodir = 1'b1;
    io_inner_1_cs_set = 1;
    io_inner_1_cs_clear = 0;
    io_inner_1_cs_hold = 0;
    io_inner_1_lock = 0;
    io_outer_tx_ready = 1;
    io_sel = 1;
    #10;

    if (io_outer_tx_valid !== 1'b1) begin
      $display("FAIL: io_outer_tx_valid should be high when inner 1 is selected and valid");
      $finish;
    end

    if (io_outer_tx_bits !== 8'hBB) begin
      $display("FAIL: io_outer_tx_bits should be 0xBB when inner 1 is selected");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule