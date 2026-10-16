`timescale 1ns/1ps

module tb_wb_dma_ch_rf_dummy;

  reg clk;
  reg rst;
  wire [31:0] pointer;
  wire [31:0] pointer_s;
  wire [31:0] ch_csr;
  wire [31:0] ch_txsz;
  wire [31:0] ch_adr0;
  wire [31:0] ch_adr1;
  wire [31:0] ch_am0;
  wire [31:0] ch_am1;
  wire [31:0] sw_pointer;
  wire ch_stop;
  wire ch_dis;
  wire int;

  reg [31:0] wb_rf_din;
  reg [7:0] wb_rf_adr;
  reg wb_rf_we;
  reg wb_rf_re;
  reg [4:0] ch_sel;
  reg ndnr;
  reg dma_busy;
  reg dma_err;
  reg dma_done;
  reg dma_done_all;
  reg [31:0] de_csr;
  reg [11:0] de_txsz;
  reg [31:0] de_adr0;
  reg [31:0] de_adr1;
  reg de_csr_we;
  reg de_txsz_we;
  reg de_adr0_we;
  reg de_adr1_we;
  reg ptr_set;
  reg de_fetch_descr;
  reg dma_rest;

  // Instantiate the module under test
  wb_dma_ch_rf_dummy uut (
    .clk(clk),
    .rst(rst),
    .pointer(pointer),
    .pointer_s(pointer_s),
    .ch_csr(ch_csr),
    .ch_txsz(ch_txsz),
    .ch_adr0(ch_adr0),
    .ch_adr1(ch_adr1),
    .ch_am0(ch_am0),
    .ch_am1(ch_am1),
    .sw_pointer(sw_pointer),
    .ch_stop(ch_stop),
    .ch_dis(ch_dis),
    .int(int),
    .wb_rf_din(wb_rf_din),
    .wb_rf_adr(wb_rf_adr),
    .wb_rf_we(wb_rf_we),
    .wb_rf_re(wb_rf_re),
    .ch_sel(ch_sel),
    .ndnr(ndnr),
    .dma_busy(dma_busy),
    .dma_err(dma_err),
    .dma_done(dma_done),
    .dma_done_all(dma_done_all),
    .de_csr(de_csr),
    .de_txsz(de_txsz),
    .de_adr0(de_adr0),
    .de_adr1(de_adr1),
    .de_csr_we(de_csr_we),
    .de_txsz_we(de_txsz_we),
    .de_adr0_we(de_adr0_we),
    .de_adr1_we(de_adr1_we),
    .de_fetch_descr(de_fetch_descr),
    .dma_rest(dma_rest),
    .ptr_set(ptr_set)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    rst = 1;
    #10;
    rst = 0;
    #10;

    // Check that all outputs are zero
    if (pointer !== 32'h0) begin
      $display("FAIL: pointer is not zero");
      $finish;
    end
    if (pointer_s !== 32'h0) begin
      $display("FAIL: pointer_s is not zero");
      $finish;
    end
    if (ch_csr !== 32'h0) begin
      $display("FAIL: ch_csr is not zero");
      $finish;
    end
    if (ch_txsz !== 32'h0) begin
      $display("FAIL: ch_txsz is not zero");
      $finish;
    end
    if (ch_adr0 !== 32'h0) begin
      $display("FAIL: ch_adr0 is not zero");
      $finish;
    end
    if (ch_adr1 !== 32'h0) begin
      $display("FAIL: ch_adr1 is not zero");
      $finish;
    end
    if (ch_am0 !== 32'h0) begin
      $display("FAIL: ch_am0 is not zero");
      $finish;
    end
    if (ch_am1 !== 32'h0) begin
      $display("FAIL: ch_am1 is not zero");
      $finish;
    end
    if (sw_pointer !== 32'h0) begin
      $display("FAIL: sw_pointer is not zero");
      $finish;
    end
    if (ch_stop !== 1'b0) begin
      $display("FAIL: ch_stop is not zero");
      $finish;
    end
    if (ch_dis !== 1'b0) begin
      $display("FAIL: ch_dis is not zero");
      $finish;
    end
    if (int !== 1'b0) begin
      $display("FAIL: int is not zero");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule