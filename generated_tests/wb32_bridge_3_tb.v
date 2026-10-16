`timescale 1ns/1ps

module tb_wb32_bridge;

  reg wb_clk_i;
  reg wb_rst_i;
  reg [22:0] wb16_adr_i;
  reg [15:0] wb16_dat_i;
  wire [15:0] wb16_dat_o;
  reg wb16_cyc_i;
  reg wb16_stb_i;
  reg wb16_we_i;
  wire wb16_ack_o;
  
  wire [21:0] wbm_adr_o;
  wire [3:0] wbm_sel_o;
  reg [31:0] wbm_dat_i;
  wire [31:0] wbm_dat_o;
  wire wbm_cyc_o;
  wire wbm_stb_o;
  wire wbm_we_o;
  reg wbm_ack_i;

  // Instantiate the unit under test (UUT)
  wb32_bridge uut (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wb16_adr_i(wb16_adr_i),
    .wb16_dat_i(wb16_dat_i),
    .wb16_dat_o(wb16_dat_o),
    .wb16_cyc_i(wb16_cyc_i),
    .wb16_stb_i(wb16_stb_i),
    .wb16_we_i(wb16_we_i),
    .wb16_ack_o(wb16_ack_o),
    .wbm_adr_o(wbm_adr_o),
    .wbm_dat_o(wbm_dat_o),
    .wbm_dat_i(wbm_dat_i),
    .wbm_cyc_o(wbm_cyc_o),
    .wbm_stb_o(wbm_stb_o),
    .wbm_we_o(wbm_we_o),
    .wbm_ack_i(wbm_ack_i),
    .wbm_sel_o(wbm_sel_o)
  );

  // Clock generation
  initial begin
    wb_clk_i = 0;
    forever #5 wb_clk_i = ~wb_clk_i; // 100MHz clock
  end

  // Reset generation
  initial begin
    wb_rst_i = 1;
    #10;
    wb_rst_i = 0;
  end

  // Test sequence
  initial begin
    // Initialize signals
    wb16_cyc_i = 0;
    wb16_stb_i = 0;
    wb16_we_i = 0;
    wb16_adr_i = 0;
    wb16_dat_i = 0;
    wbm_ack_i = 0;
    wbm_dat_i = 32'h00000000;

    // Test Write Operation
    wb16_adr_i = 23'h0000000; // Address 0
    wb16_dat_i = 16'hABCD; // Data to write
    wb16_cyc_i = 1;
    wb16_stb_i = 1;
    wb16_we_i = 1;
    #10;

    // Check if ack is received
    if (!wb16_ack_o) begin
      $display("FAIL: Write operation not acknowledged");
      $finish;
    end

    // Check if data is latched correctly
    if (uut.datlatch !== 16'hABCD) begin
      $display("FAIL: Data latch incorrect after write");
      $finish;
    end

    // Test Read Operation
    wb16_adr_i = 23'h0000001; // Address 1
    wb16_cyc_i = 1;
    wb16_stb_i = 1;
    wb16_we_i = 0; // Read operation
    wbm_dat_i = 32'h1234ABCD; // Simulated data from the 32-bit bus
    #10;

    // Check if ack is received
    if (!wb16_ack_o) begin
      $display("FAIL: Read operation not acknowledged");
      $finish;
    end

    // Check if the output data is correct
    if (wb16_dat_o !== 16'hABCD) begin
      $display("FAIL: Read data incorrect");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule