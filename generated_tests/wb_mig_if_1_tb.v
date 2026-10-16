`timescale 1ns/1ps

module tb_wb_mig_if;

  // Parameters
  reg [31:0] wb_adr_i;
  reg [1:0] wb_bte_i;
  reg [2:0] wb_cti_i;
  reg wb_cyc_i;
  reg [31:0] wb_dat_i;
  reg [3:0] wb_sel_i;
  reg wb_stb_i;
  reg wb_we_i;
  reg wb_clk_i;
  reg wb_rst_i;
  reg cmd_empty_i;
  reg cmd_full_i;
  reg wr_full_i;
  reg wr_empty_i;
  reg [6:0] wr_count_i;
  reg wr_underrun_i;
  reg wr_error_i;
  reg [31:0] rd_data_i;
  reg rd_full_i;
  reg rd_empty_i;
  reg [6:0] rd_count_i;
  reg rd_overflow_i;
  reg rd_error_i;

  wire [31:0] wb_dat_o;
  wire wb_ack_o;
  wire wb_err_o;
  wire wb_rty_o;
  wire cmd_clk_o;
  wire cmd_en_o;
  wire [2:0] cmd_instr_o;
  wire [5:0] cmd_bl_o;
  wire [29:0] cmd_byte_addr_o;
  wire wr_clk_o;
  wire wr_en_o;
  wire [3:0] wr_mask_o;
  wire [31:0] wr_data_o;
  wire rd_clk_o;
  wire rd_en_o;

  // Instantiate the Unit Under Test (UUT)
  wb_mig_if uut (
    .wb_dat_o(wb_dat_o),
    .wb_ack_o(wb_ack_o),
    .wb_err_o(wb_err_o),
    .wb_rty_o(wb_rty_o),
    .cmd_clk_o(cmd_clk_o),
    .cmd_en_o(cmd_en_o),
    .cmd_instr_o(cmd_instr_o),
    .cmd_bl_o(cmd_bl_o),
    .cmd_byte_addr_o(cmd_byte_addr_o),
    .wr_clk_o(wr_clk_o),
    .wr_en_o(wr_en_o),
    .wr_mask_o(wr_mask_o),
    .wr_data_o(wr_data_o),
    .rd_clk_o(rd_clk_o),
    .rd_en_o(rd_en_o),
    .wb_adr_i(wb_adr_i),
    .wb_bte_i(wb_bte_i),
    .wb_cti_i(wb_cti_i),
    .wb_cyc_i(wb_cyc_i),
    .wb_dat_i(wb_dat_i),
    .wb_sel_i(wb_sel_i),
    .wb_stb_i(wb_stb_i),
    .wb_we_i(wb_we_i),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .cmd_empty_i(cmd_empty_i),
    .cmd_full_i(cmd_full_i),
    .wr_full_i(wr_full_i),
    .wr_empty_i(wr_empty_i),
    .wr_count_i(wr_count_i),
    .wr_underrun_i(wr_underrun_i),
    .wr_error_i(wr_error_i),
    .rd_data_i(rd_data_i),
    .rd_full_i(rd_full_i),
    .rd_empty_i(rd_empty_i),
    .rd_count_i(rd_count_i),
    .rd_overflow_i(rd_overflow_i),
    .rd_error_i(rd_error_i)
  );

  // Clock generation
  initial begin
    wb_clk_i = 0;
    forever #5 wb_clk_i = ~wb_clk_i; // 100MHz clock
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
    wb_adr_i = 32'h0;
    wb_bte_i = 2'b00;
    wb_cti_i = 3'b000;
    wb_cyc_i = 0;
    wb_dat_i = 32'hA5A5A5A5;
    wb_sel_i = 4'b1111;
    wb_stb_i = 0;
    wb_we_i = 0;
    cmd_empty_i = 1;
    cmd_full_i = 0;
    wr_full_i = 0;
    wr_empty_i = 1;
    wr_count_i = 7'b0;
    wr_underrun_i = 0;
    wr_error_i = 0;
    rd_data_i = 32'h5A5A5A5A;
    rd_full_i = 0;
    rd_empty_i = 1;
    rd_count_i = 7'b0;
    rd_overflow_i = 0;
    rd_error_i = 0;

    // Test Write Operation
    wb_cyc_i = 1;
    wb_stb_i = 1;
    wb_we_i = 1;
    #10;
    if (wb_ack_o !== 1'b0) begin
      $display("FAIL: Write operation did not get acknowledged");
      $finish;
    end

    // Test Read Operation
    wb_we_i = 0;
    wb_adr_i = 32'h4;
    #10;
    if (wb_ack_o !== 1'b0) begin
      $display("FAIL: Read operation did not get acknowledged");
      $finish;
    end

    // Check output data
    if (wb_dat_o !== rd_data_i) begin
      $display("FAIL: Read data mismatch, expected %h, got %h", rd_data_i, wb_dat_o);
      $finish;
    end

    // Check for errors
    if (wb_err_o !== 1'b0) begin
      $display("FAIL: Unexpected error signal asserted");
      $finish;
    end

    // Finalize test
    $display("PASS");
    $finish;
  end

endmodule