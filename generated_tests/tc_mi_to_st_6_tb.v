`timescale 1ns/1ps

module tb_tc_mi_to_st;

  // Parameters
  parameter CLK_PERIOD = 10;

  // Inputs
  reg wb_clk_i;
  reg wb_rst_i;
  reg i0_wb_cyc_i;
  reg i0_wb_stb_i;
  reg [1:0] i0_wb_adr_i;
  reg [1:0] i0_wb_sel_i;
  reg i0_wb_we_i;
  reg [1:0] i0_wb_dat_i;
  
  reg i1_wb_cyc_i;
  reg i1_wb_stb_i;
  reg [1:0] i1_wb_adr_i;
  reg [1:0] i1_wb_sel_i;
  reg i1_wb_we_i;
  reg [1:0] i1_wb_dat_i;

  reg i2_wb_cyc_i;
  reg i2_wb_stb_i;
  reg [1:0] i2_wb_adr_i;
  reg [1:0] i2_wb_sel_i;
  reg i2_wb_we_i;
  reg [1:0] i2_wb_dat_i;

  reg i3_wb_cyc_i;
  reg i3_wb_stb_i;
  reg [1:0] i3_wb_adr_i;
  reg [1:0] i3_wb_sel_i;
  reg i3_wb_we_i;
  reg [1:0] i3_wb_dat_i;

  reg i4_wb_cyc_i;
  reg i4_wb_stb_i;
  reg [1:0] i4_wb_adr_i;
  reg [1:0] i4_wb_sel_i;
  reg i4_wb_we_i;
  reg [1:0] i4_wb_dat_i;

  reg i5_wb_cyc_i;
  reg i5_wb_stb_i;
  reg [1:0] i5_wb_adr_i;
  reg [1:0] i5_wb_sel_i;
  reg i5_wb_we_i;
  reg [1:0] i5_wb_dat_i;

  reg i6_wb_cyc_i;
  reg i6_wb_stb_i;
  reg [1:0] i6_wb_adr_i;
  reg [1:0] i6_wb_sel_i;
  reg i6_wb_we_i;
  reg [1:0] i6_wb_dat_i;

  reg i7_wb_cyc_i;
  reg i7_wb_stb_i;
  reg [1:0] i7_wb_adr_i;
  reg [1:0] i7_wb_sel_i;
  reg i7_wb_we_i;
  reg [1:0] i7_wb_dat_i;

  // Outputs
  wire [1:0] i0_wb_dat_o;
  wire i0_wb_ack_o;
  wire i0_wb_err_o;

  wire [1:0] i1_wb_dat_o;
  wire i1_wb_ack_o;
  wire i1_wb_err_o;

  wire [1:0] i2_wb_dat_o;
  wire i2_wb_ack_o;
  wire i2_wb_err_o;

  wire [1:0] i3_wb_dat_o;
  wire i3_wb_ack_o;
  wire i3_wb_err_o;

  wire [1:0] i4_wb_dat_o;
  wire i4_wb_ack_o;
  wire i4_wb_err_o;

  wire [1:0] i5_wb_dat_o;
  wire i5_wb_ack_o;
  wire i5_wb_err_o;

  wire [1:0] i6_wb_dat_o;
  wire i6_wb_ack_o;
  wire i6_wb_err_o;

  wire [1:0] i7_wb_dat_o;
  wire i7_wb_ack_o;
  wire i7_wb_err_o;

  wire t0_wb_cyc_o;
  wire t0_wb_stb_o;
  wire [1:0] t0_wb_adr_o;
  wire [1:0] t0_wb_sel_o;
  wire t0_wb_we_o;
  wire [1:0] t0_wb_dat_o;
  
  reg [1:0] t0_wb_dat_i;
  reg t0_wb_ack_i;
  reg t0_wb_err_i;

  // Instantiate the Unit Under Test (UUT)
  tc_mi_to_st uut (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .i0_wb_cyc_i(i0_wb_cyc_i),
    .i0_wb_stb_i(i0_wb_stb_i),
    .i0_wb_adr_i(i0_wb_adr_i),
    .i0_wb_sel_i(i0_wb_sel_i),
    .i0_wb_we_i(i0_wb_we_i),
    .i0_wb_dat_i(i0_wb_dat_i),
    .i0_wb_dat_o(i0_wb_dat_o),
    .i0_wb_ack_o(i0_wb_ack_o),
    .i0_wb_err_o(i0_wb_err_o),
    .i1_wb_cyc_i(i1_wb_cyc_i),
    .i1_wb_stb_i(i1_wb_stb_i),
    .i1_wb_adr_i(i1_wb_adr_i),
    .i1_wb_sel_i(i1_wb_sel_i),
    .i1_wb_we_i(i1_wb_we_i),
    .i1_wb_dat_i(i1_wb_dat_i),
    .i1_wb_dat_o(i1_wb_dat_o),
    .i1_wb_ack_o(i1_wb_ack_o),
    .i1_wb_err_o(i1_wb_err_o),
    .i2_wb_cyc_i(i2_wb_cyc_i),
    .i2_wb_stb_i(i2_wb_stb_i),
    .i2_wb_adr_i(i2_wb_adr_i),
    .i2_wb_sel_i(i2_wb_sel_i),
    .i2_wb_we_i(i2_wb_we_i),
    .i2_wb_dat_i(i2_wb_dat_i),
    .i2_wb_dat_o(i2_wb_dat_o),
    .i2_wb_ack_o(i2_wb_ack_o),
    .i2_wb_err_o(i2_wb_err_o),
    .i3_wb_cyc_i(i3_wb_cyc_i),
    .i3_wb_stb_i(i3_wb_stb_i),
    .i3_wb_adr_i(i3_wb_adr_i),
    .i3_wb_sel_i(i3_wb_sel_i),
    .i3_wb_we_i(i3_wb_we_i),
    .i3_wb_dat_i(i3_wb_dat_i),
    .i3_wb_dat_o(i3_wb_dat_o),
    .i3_wb_ack_o(i3_wb_ack_o),
    .i3_wb_err_o(i3_wb_err_o),
    .i4_wb_cyc_i(i4_wb_cyc_i),
    .i4_wb_stb_i(i4_wb_stb_i),
    .i4_wb_adr_i(i4_wb_adr_i),
    .i4_wb_sel_i(i4_wb_sel_i),
    .i4_wb_we_i(i4_wb_we_i),
    .i4_wb_dat_i(i4_wb_dat_i),
    .i4_wb_dat_o(i4_wb_dat_o),
    .i4_wb_ack_o(i4_wb_ack_o),
    .i4_wb_err_o(i4_wb_err_o),
    .i5_wb_cyc_i(i5_wb_cyc_i),
    .i5_wb_stb_i(i5_wb_stb_i),
    .i5_wb_adr_i(i5_wb_adr_i),
    .i5_wb_sel_i(i5_wb_sel_i),
    .i5_wb_we_i(i5_wb_we_i),
    .i5_wb_dat_i(i5_wb_dat_i),
    .i5_wb_dat_o(i5_wb_dat_o),
    .i5_wb_ack_o(i5_wb_ack_o),
    .i5_wb_err_o(i5_wb_err_o),
    .i6_wb_cyc_i(i6_wb_cyc_i),
    .i6_wb_stb_i(i6_wb_stb_i),
    .i6_wb_adr_i(i6_wb_adr_i),
    .i6_wb_sel_i(i6_wb_sel_i),
    .i6_wb_we_i(i6_wb_we_i),
    .i6_wb_dat_i(i6_wb_dat_i),
    .i6_wb_dat_o(i6_wb_dat_o),
    .i6_wb_ack_o(i6_wb_ack_o),
    .i6_wb_err_o(i6_wb_err_o),
    .i7_wb_cyc_i(i7_wb_cyc_i),
    .i7_wb_stb_i(i7_wb_stb_i),
    .i7_wb_adr_i(i7_wb_adr_i),
    .i7_wb_sel_i(i7_wb_sel_i),
    .i7_wb_we_i(i7_wb_we_i),
    .i7_wb_dat_i(i7_wb_dat_i),
    .i7_wb_dat_o(i7_wb_dat_o),
    .i7_wb_ack_o(i7_wb_ack_o),
    .i7_wb_err_o(i7_wb_err_o),
    .t0_wb_cyc_o(t0_wb_cyc_o),
    .t0_wb_stb_o(t0_wb_stb_o),
    .t0_wb_adr_o(t0_wb_adr_o),
    .t0_wb_sel_o(t0_wb_sel_o),
    .t0_wb_we_o(t0_wb_we_o),
    .t0_wb_dat_o(t0_wb_dat_o),
    .t0_wb_dat_i(t0_wb_dat_i),
    .t0_wb_ack_i(t0_wb_ack_i),
    .t0_wb_err_i(t0_wb_err_i)
  );

  // Clock generation
  initial begin
    wb_clk_i = 0;
    forever #(CLK_PERIOD/2) wb_clk_i = ~wb_clk_i;
  end

  // Reset generation
  initial begin
    wb_rst_i = 1;
    #15;
    wb_rst_i = 0;
  end

  // Test sequence
  initial begin
    // Initialize inputs
    i0_wb_cyc_i = 0; i0_wb_stb_i = 0; i0_wb_adr_i = 0; i0_wb_sel_i = 0; i0_wb_we_i = 0; i0_wb_dat_i = 0;
    i1_wb_cyc_i = 0; i1_wb_stb_i = 0; i1_wb_adr_i = 0; i1_wb_sel_i = 0; i1_wb_we_i = 0; i1_wb_dat_i = 0;
    i2_wb_cyc_i = 0; i2_wb_stb_i = 0; i2_wb_adr_i = 0; i2_wb_sel_i = 0; i2_wb_we_i = 0; i2_wb_dat_i = 0;
    i3_wb_cyc_i = 0; i3_wb_stb_i = 0; i3_wb_adr_i = 0; i3_wb_sel_i = 0; i3_wb_we_i = 0; i3_wb_dat_i = 0;
    i4_wb_cyc_i = 0; i4_wb_stb_i = 0; i4_wb_adr_i = 0; i4_wb_sel_i = 0; i4_wb_we_i = 0; i4_wb_dat_i = 0;
    i5_wb_cyc_i = 0; i5_wb_stb_i = 0; i5_wb_adr_i = 0; i5_wb_sel_i = 0; i5_wb_we_i = 0; i5_wb_dat_i = 0;
    i6_wb_cyc_i = 0; i6_wb_stb_i = 0; i6_wb_adr_i = 0; i6_wb_sel_i = 0; i6_wb_we_i = 0; i6_wb_dat_i = 0;
    i7_wb_cyc_i = 0; i7_wb_stb_i = 0; i7_wb_adr_i = 0; i7_wb_sel_i = 0; i7_wb_we_i = 0; i7_wb_dat_i = 0;

    // Test case 1: Initiator 0 requests access
    i0_wb_cyc_i = 1;
    i0_wb_stb_i = 1;
    i0_wb_adr_i = 2'b00;
    i0_wb_sel_i = 2'b11;
    i0_wb_we_i = 1;
    i0_wb_dat_i = 2'b10;
    #CLK_PERIOD;

    // Check if target acknowledges
    if (!i0_wb_ack_o) begin
      $display("FAIL: Initiator 0 did not receive acknowledgment");
      $finish;
    end

    // Test case 2: Initiator 1 requests access
    i0_wb_cyc_i = 0; i0_wb_stb_i = 0; // Release initiator 0
    i1_wb_cyc_i = 1;
    i1_wb_stb_i = 1;
    i1_wb_adr_i = 2'b00;
    i1_wb_sel_i = 2'b11;
    i1_wb_we_i = 1;
    i1_wb_dat_i = 2'b11;
    #CLK_PERIOD;

    // Check if target acknowledges
    if (!i1_wb_ack_o) begin
      $display("FAIL: Initiator 1 did not receive acknowledgment");
      $finish;
    end

    // Test case 3: Initiator 2 requests access while initiator 1 is active
    i1_wb_cyc_i = 0; i1_wb_stb_i = 0; // Release initiator 1
    i2_wb_cyc_i = 1;
    i2_wb_stb_i = 1;
    i2_wb_adr_i = 2'b00;
    i2_wb_sel_i = 2'b11;
    i2_wb_we_i = 1;
    i2_wb_dat_i = 2'b01;
    #CLK_PERIOD;

    // Check if target acknowledges
    if (!i2_wb_ack_o) begin
      $display("FAIL: Initiator 2 did not receive acknowledgment");
      $finish;
    end

    // Test case 4: Multiple initiators requesting access
    i0_wb_cyc_i = 1; i0_wb_stb_i = 1; // Initiator 0 requests again
    i1_wb_cyc_i = 1; i1_wb_stb_i = 1; // Initiator 1 also requests
    #CLK_PERIOD;

    // Check if only the highest priority initiator (0) gets acknowledged
    if (i0_wb_ack_o && i1_wb_ack_o) begin
      $display("FAIL: Both initiators received acknowledgment");
      $finish;
    end else if (!i0_wb_ack_o && i1_wb_ack_o) begin
      $display("FAIL: Initiator 1 should not have been acknowledged");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule