`timescale 1ns/1ps

module tb_gfx_wbm_read;

  // Parameters
  reg clk_i;
  reg rst_i;
  wire cyc_o;
  wire stb_o;
  wire [2:0] cti_o;
  wire [1:0] bte_o;
  wire we_o;
  wire [31:0] adr_o;
  wire [3:0] sel_o;
  reg ack_i;
  reg err_i;
  reg [31:0] dat_i;
  wire sint_o;
  reg read_request_i;
  reg [31:2] texture_addr_i;
  reg [3:0] texture_sel_i;
  wire [31:0] texture_dat_o;
  wire texture_data_ack;

  // Instantiate the Unit Under Test (UUT)
  gfx_wbm_read uut (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .cyc_o(cyc_o),
    .stb_o(stb_o),
    .cti_o(cti_o),
    .bte_o(bte_o),
    .we_o(we_o),
    .adr_o(adr_o),
    .sel_o(sel_o),
    .ack_i(ack_i),
    .err_i(err_i),
    .dat_i(dat_i),
    .sint_o(sint_o),
    .read_request_i(read_request_i),
    .texture_addr_i(texture_addr_i),
    .texture_sel_i(texture_sel_i),
    .texture_dat_o(texture_dat_o),
    .texture_data_ack(texture_data_ack)
  );

  // Clock generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_i = 1;
    ack_i = 0;
    err_i = 0;
    dat_i = 32'hDEADBEEF;
    read_request_i = 0;
    texture_addr_i = 32'h00000000;
    texture_sel_i = 4'b1111;

    // Release reset
    #10 rst_i = 0;

    // Test 1: Normal read request
    #10 read_request_i = 1; // Initiate read request
    #10 read_request_i = 0; // Clear read request

    // Wait for acknowledgment
    #10 ack_i = 1; // Simulate acknowledgment from Wishbone
    #10 ack_i = 0; // Clear acknowledgment

    // Check texture data acknowledgment
    if (!texture_data_ack) begin
      $display("FAIL: texture_data_ack should be high after ack_i");
      $finish;
    end

    // Check data output
    if (texture_dat_o !== dat_i) begin
      $display("FAIL: texture_dat_o should match dat_i");
      $finish;
    end

    // Test 2: Error condition
    #10 read_request_i = 1; // Initiate read request
    #10 read_request_i = 0; // Clear read request
    err_i = 1; // Simulate error condition

    // Wait for acknowledgment
    #10 ack_i = 1; // Simulate acknowledgment from Wishbone
    #10 ack_i = 0; // Clear acknowledgment

    // Check sint_o for error indication
    if (!sint_o) begin
      $display("FAIL: sint_o should be high on error condition");
      $finish;
    end

    // Reset error condition
    err_i = 0;

    // Test 3: No read request
    #10 read_request_i = 0; // Ensure no read request is active
    #10;

    // Check that cyc_o is low
    if (cyc_o) begin
      $display("FAIL: cyc_o should be low when no read request is active");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule