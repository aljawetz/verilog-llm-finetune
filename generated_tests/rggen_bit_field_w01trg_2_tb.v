`timescale 1ns/1ps

module tb_rggen_bit_field_w01trg;

  parameter WIDTH = 8;
  parameter TRIGGER_VALUE = 1'b1; // Change as needed for testing

  reg i_clk;
  reg i_rst_n;
  reg i_sw_valid;
  reg [WIDTH-1:0] i_sw_read_mask;
  reg i_sw_write_enable;
  reg [WIDTH-1:0] i_sw_write_mask;
  reg [WIDTH-1:0] i_sw_write_data;
  wire [WIDTH-1:0] o_sw_read_data;
  wire [WIDTH-1:0] o_sw_value;
  reg [WIDTH-1:0] i_value;
  wire [WIDTH-1:0] o_trigger;

  rggen_bit_field_w01trg #(
    .TRIGGER_VALUE(TRIGGER_VALUE),
    .WIDTH(WIDTH)
  ) uut (
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_sw_valid(i_sw_valid),
    .i_sw_read_mask(i_sw_read_mask),
    .i_sw_write_enable(i_sw_write_enable),
    .i_sw_write_mask(i_sw_write_mask),
    .i_sw_write_data(i_sw_write_data),
    .o_sw_read_data(o_sw_read_data),
    .o_sw_value(o_sw_value),
    .i_value(i_value),
    .o_trigger(o_trigger)
  );

  initial begin
    // Initialize signals
    i_clk = 0;
    i_rst_n = 0;
    i_sw_valid = 0;
    i_sw_write_enable = 0;
    i_sw_read_mask = 8'hFF;
    i_sw_write_mask = 8'hFF;
    i_sw_write_data = 8'h00;
    i_value = 8'hAA; // Example value for read data

    // Release reset
    #5 i_rst_n = 1;

    // Test case 1: Write data with valid signal
    #10;
    i_sw_valid = 1;
    i_sw_write_data = 8'h55; // Data to write
    i_sw_write_mask = 8'hFF;  // Full mask
    #10;
    if (o_sw_value !== 8'h55) begin
      $display("FAIL: Expected o_sw_value = 8'h55, got o_sw_value = %h", o_sw_value);
      $finish;
    end

    // Test case 2: Check read data
    #10;
    if (o_sw_read_data !== i_value) begin
      $display("FAIL: Expected o_sw_read_data = %h, got o_sw_read_data = %h", i_value, o_sw_read_data);
      $finish;
    end

    // Test case 3: Write data with masked bits
    #10;
    i_sw_write_data = 8'hAA; // Data to write
    i_sw_write_mask = 8'h0F;  // Mask lower nibble
    #10;
    if (o_sw_value !== 8'h0A) begin // Only lower nibble should be affected
      $display("FAIL: Expected o_sw_value = 8'h0A, got o_sw_value = %h", o_sw_value);
      $finish;
    end

    // Test case 4: Inactive trigger
    #10;
    i_sw_valid = 0; // Deactivate valid signal
    #10;
    if (o_sw_value !== 8'h00) begin
      $display("FAIL: Expected o_sw_value = 8'h00 after deactivation, got o_sw_value = %h", o_sw_value);
      $finish;
    end

    // Test case 5: Reset functionality
    #10;
    i_rst_n = 0; // Assert reset
    #5;
    i_rst_n = 1; // Release reset
    #10;
    if (o_sw_value !== 8'h00) begin
      $display("FAIL: Expected o_sw_value = 8'h00 after reset, got o_sw_value = %h", o_sw_value);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

  always #5 i_clk = ~i_clk; // Clock generation

endmodule