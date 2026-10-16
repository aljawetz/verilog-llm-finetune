`timescale 1ns/1ps

module tb_mor1kx_lsu_espresso;

  // Parameters
  parameter OPTION_OPERAND_WIDTH = 32;

  // Inputs
  reg clk;
  reg rst;
  reg padv_fetch_i;
  reg [OPTION_OPERAND_WIDTH-1:0] lsu_adr_i;
  reg [OPTION_OPERAND_WIDTH-1:0] rfb_i;
  reg op_lsu_load_i;
  reg op_lsu_store_i;
  reg [1:0] lsu_length_i;
  reg lsu_zext_i;
  reg exception_taken_i;
  reg du_restart_i;
  reg stepping_i;
  reg next_fetch_done_i;
  reg dbus_err_i;
  reg dbus_ack_i;
  reg [OPTION_OPERAND_WIDTH-1:0] dbus_dat_i;

  // Outputs
  wire [OPTION_OPERAND_WIDTH-1:0] lsu_result_o;
  wire lsu_valid_o;
  wire lsu_except_dbus_o;
  wire lsu_except_align_o;
  wire [OPTION_OPERAND_WIDTH-1:0] dbus_adr_o;
  wire dbus_req_o;
  wire [OPTION_OPERAND_WIDTH-1:0] dbus_dat_o;
  wire [3:0] dbus_bsel_o;
  wire dbus_we_o;
  wire dbus_burst_o;

  // Instantiate the Unit Under Test (UUT)
  mor1kx_lsu_espresso uut (
    .clk(clk),
    .rst(rst),
    .padv_fetch_i(padv_fetch_i),
    .lsu_adr_i(lsu_adr_i),
    .rfb_i(rfb_i),
    .op_lsu_load_i(op_lsu_load_i),
    .op_lsu_store_i(op_lsu_store_i),
    .lsu_length_i(lsu_length_i),
    .lsu_zext_i(lsu_zext_i),
    .exception_taken_i(exception_taken_i),
    .du_restart_i(du_restart_i),
    .stepping_i(stepping_i),
    .next_fetch_done_i(next_fetch_done_i),
    .dbus_err_i(dbus_err_i),
    .dbus_ack_i(dbus_ack_i),
    .dbus_dat_i(dbus_dat_i),
    .lsu_result_o(lsu_result_o),
    .lsu_valid_o(lsu_valid_o),
    .lsu_except_dbus_o(lsu_except_dbus_o),
    .lsu_except_align_o(lsu_except_align_o),
    .dbus_adr_o(dbus_adr_o),
    .dbus_req_o(dbus_req_o),
    .dbus_dat_o(dbus_dat_o),
    .dbus_bsel_o(dbus_bsel_o),
    .dbus_we_o(dbus_we_o),
    .dbus_burst_o(dbus_burst_o)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Reset and stimulus generation
  initial begin
    // Initialize inputs
    rst = 1;
    padv_fetch_i = 0;
    lsu_adr_i = 0;
    rfb_i = 0;
    op_lsu_load_i = 0;
    op_lsu_store_i = 0;
    lsu_length_i = 0;
    lsu_zext_i = 0;
    exception_taken_i = 0;
    du_restart_i = 0;
    stepping_i = 0;
    next_fetch_done_i = 0;
    dbus_err_i = 0;
    dbus_ack_i = 0;
    dbus_dat_i = 0;

    // Release reset
    #10 rst = 0;

    // Test case 1: Simple load operation
    lsu_adr_i = 32'h0000_0004; // Address for load
    rfb_i = 32'hDEADBEEF; // Data to load
    op_lsu_load_i = 1;
    lsu_length_i = 2'b10; // Word access
    #10 padv_fetch_i = 1; // Trigger fetch
    #10 padv_fetch_i = 0; // Clear fetch

    // Simulate DBus response
    dbus_ack_i = 1; // Acknowledge the request
    dbus_dat_i = rfb_i; // Return data
    #10 dbus_ack_i = 0; // Clear acknowledge

    // Check results
    if (lsu_result_o !== rfb_i) begin
      $display("FAIL: Load operation failed, expected %h, got %h", rfb_i, lsu_result_o);
      $finish;
    end

    // Test case 2: Simple store operation
    lsu_adr_i = 32'h0000_0008; // Address for store
    rfb_i = 32'h12345678; // Data to store
    op_lsu_store_i = 1;
    lsu_length_i = 2'b10; // Word access
    #10 padv_fetch_i = 1; // Trigger fetch
    #10 padv_fetch_i = 0; // Clear fetch

    // Check DBus outputs
    if (dbus_adr_o !== lsu_adr_i) begin
      $display("FAIL: Store address mismatch, expected %h, got %h", lsu_adr_i, dbus_adr_o);
      $finish;
    end
    if (dbus_dat_o !== rfb_i) begin
      $display("FAIL: Store data mismatch, expected %h, got %h", rfb_i, dbus_dat_o);
      $finish;
    end
    if (dbus_we_o !== 1) begin
      $display("FAIL: Store operation not indicated");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule