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

  // Instantiate the module under test (uut)
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
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
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

    // Check outputs after reset
    #10;
    if (csc !== 32'h0) begin
      $display("FAIL: csc should be 0 after reset");
      $finish;
    end
    if (tms !== 32'h0) begin
      $display("FAIL: tms should be 0 after reset");
      $finish;
    end
    if (cs !== 1'b0) begin
      $display("FAIL: cs should be 0 after reset");
      $finish;
    end
    if (wp_err !== 1'b0) begin
      $display("FAIL: wp_err should be 0 after reset");
      $finish;
    end
    if (lmr_req !== 1'b0) begin
      $display("FAIL: lmr_req should be 0 after reset");
      $finish;
    end
    if (init_req !== 1'b0) begin
      $display("FAIL: init_req should be 0 after reset");
      $finish;
    end

    // Test with various inputs
    #10 wb_we_i = 1; din = 32'hA5A5A5A5; rf_we = 1; addr = 32'h1; // Write operation
    #10;
    if (csc !== 32'h0 || tms !== 32'h0 || cs !== 1'b0 || wp_err !== 1'b0 || lmr_req !== 1'b0 || init_req !== 1'b0) begin
      $display("FAIL: Outputs should remain constant regardless of inputs");
      $finish;
    end

    // Final check
    #10;
    if (csc !== 32'h0) begin
      $display("FAIL: csc should be 0 at the end of test");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule