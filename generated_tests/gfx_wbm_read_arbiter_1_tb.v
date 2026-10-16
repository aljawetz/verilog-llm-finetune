`timescale 1ns/1ps

module tb_gfx_wbm_read_arbiter;

  // Parameters
  reg clk;
  reg rst_n;

  // Inputs
  reg [31:0] dat_i;
  reg ack_i;
  reg m0_read_request_i;
  reg [31:2] m0_addr_i;
  reg [3:0] m0_sel_i;
  reg m1_read_request_i;
  reg [31:2] m1_addr_i;
  reg [3:0] m1_sel_i;
  reg m2_read_request_i;
  reg [31:2] m2_addr_i;
  reg [3:0] m2_sel_i;

  // Outputs
  wire master_busy_o;
  wire read_request_o;
  wire [31:2] addr_o;
  wire [3:0] sel_o;
  wire [31:0] m0_dat_o;
  wire m0_ack_o;
  wire [31:0] m1_dat_o;
  wire m1_ack_o;
  wire [31:0] m2_dat_o;
  wire m2_ack_o;

  // Instantiate the module under test (uut)
  gfx_wbm_read_arbiter uut (
    .master_busy_o(master_busy_o),
    .read_request_o(read_request_o),
    .addr_o(addr_o),
    .sel_o(sel_o),
    .dat_i(dat_i),
    .ack_i(ack_i),
    .m0_read_request_i(m0_read_request_i),
    .m0_addr_i(m0_addr_i),
    .m0_sel_i(m0_sel_i),
    .m0_dat_o(m0_dat_o),
    .m0_ack_o(m0_ack_o),
    .m1_read_request_i(m1_read_request_i),
    .m1_addr_i(m1_addr_i),
    .m1_sel_i(m1_sel_i),
    .m1_dat_o(m1_dat_o),
    .m1_ack_o(m1_ack_o),
    .m2_read_request_i(m2_read_request_i),
    .m2_addr_i(m2_addr_i),
    .m2_sel_i(m2_sel_i),
    .m2_dat_o(m2_dat_o),
    .m2_ack_o(m2_ack_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Reset logic
  initial begin
    rst_n = 0;
    #15;
    rst_n = 1;
  end

  // Test sequence
  initial begin
    // Initialize inputs
    dat_i = 32'h0;
    ack_i = 0;
    m0_read_request_i = 0;
    m1_read_request_i = 0;
    m2_read_request_i = 0;

    // Test case 1: Master 0 requests read
    m0_read_request_i = 1;
    m0_addr_i = 32'h00000000;
    m0_sel_i = 4'b1111;
    #10;
    ack_i = 1; // Simulate acknowledgment
    #10;
    ack_i = 0;
    m0_read_request_i = 0;

    // Check outputs
    if (read_request_o !== 1 || addr_o !== 32'h00000000 || sel_o !== 4'b1111) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Master 1 requests read
    m1_read_request_i = 1;
    m1_addr_i = 32'h00000004;
    m1_sel_i = 4'b1110;
    #10;
    ack_i = 1; // Simulate acknowledgment
    #10;
    ack_i = 0;
    m1_read_request_i = 0;

    // Check outputs
    if (read_request_o !== 1 || addr_o !== 32'h00000004 || sel_o !== 4'b1110) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Master 2 requests read
    m2_read_request_i = 1;
    m2_addr_i = 32'h00000008;
    m2_sel_i = 4'b1100;
    #10;
    ack_i = 1; // Simulate acknowledgment
    #10;
    ack_i = 0;
    m2_read_request_i = 0;

    // Check outputs
    if (read_request_o !== 1 || addr_o !== 32'h00000008 || sel_o !== 4'b1100) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: No masters requesting
    #10;
    if (master_busy_o !== 0 || read_request_o !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule