`timescale 1ns/1ps

module tb_mc_cs_rf_dummy;

  reg clk;
  reg rst;
  reg wb_we_i;
  reg [31:0] din;
  reg rf_we;
  reg [31:0] addr;
  reg [31:0] poc;
  reg [31:0] csc_mask;
  reg lmr_ack;
  reg init_ack;

  wire [31:0] csc;
  wire [31:0] tms;
  wire cs;
  wire wp_err;
  wire lmr_req;
  wire init_req;

  // Instantiate the unit under test (uut)
  mc_cs_rf_dummy uut (
    .clk(clk),
    .rst(rst),
    .wb_we_i(wb_we_i),
    .din(din),
    .rf_we(rf_we),
    .addr(addr),
    .csc(csc),
    .tms(tms),
    .poc(poc),
    .csc_mask(csc_mask),
    .cs(cs),
    .wp_err(wp_err),
    .lmr_req(lmr_req),
    .lmr_ack(lmr_ack),
    .init_req(init_req),
    .init_ack(init_ack)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    wb_we_i = 0;
    din = 32'h0;
    rf_we = 0;
    addr = 32'h0;
    poc = 32'h0;
    csc_mask = 32'h0;
    lmr_ack = 0;
    init_ack = 0;

    // Release reset
    #10 rst = 0;

    // Check default outputs
    #10;
    if (csc !== 32'h0) begin
      $display("FAIL: csc should be 0");
      $finish;
    end
    if (tms !== 32'h0) begin
      $display("FAIL: tms should be 0");
      $finish;
    end
    if (cs !== 1'b0) begin
      $display("FAIL: cs should be 0");
      $finish;
    end
    if (wp_err !== 1'b0) begin
      $display("FAIL: wp_err should be 0");
      $finish;
    end
    if (lmr_req !== 1'b0) begin
      $display("FAIL: lmr_req should be 0");
      $finish;
    end
    if (init_req !== 1'b0) begin
      $display("FAIL: init_req should be 0");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule