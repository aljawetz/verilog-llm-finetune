`timescale 1ns/1ps

module tb_gtwizard_ultrascale_v1_7_13_gtwiz_userdata_rx;

  // Parameters
  parameter integer P_RX_USER_DATA_WIDTH       = 32;
  parameter integer P_RX_DATA_DECODING         = 0;
  parameter integer P_TOTAL_NUMBER_OF_CHANNELS = 1;

  // Inputs
  reg [(P_TOTAL_NUMBER_OF_CHANNELS*128)-1:0] rxdata_in;
  reg [(P_TOTAL_NUMBER_OF_CHANNELS*16)-1:0]  rxctrl0_in;
  reg [(P_TOTAL_NUMBER_OF_CHANNELS*16)-1:0]  rxctrl1_in;

  // Outputs
  wire [(P_TOTAL_NUMBER_OF_CHANNELS*P_RX_USER_DATA_WIDTH)-1:0] gtwiz_userdata_rx_out;

  // Instantiate the Unit Under Test (UUT)
  gtwizard_ultrascale_v1_7_13_gtwiz_userdata_rx #(
    .P_RX_USER_DATA_WIDTH(P_RX_USER_DATA_WIDTH),
    .P_RX_DATA_DECODING(P_RX_DATA_DECODING),
    .P_TOTAL_NUMBER_OF_CHANNELS(P_TOTAL_NUMBER_OF_CHANNELS)
  ) uut (
    .rxdata_in(rxdata_in),
    .rxctrl0_in(rxctrl0_in),
    .rxctrl1_in(rxctrl1_in),
    .gtwiz_userdata_rx_out(gtwiz_userdata_rx_out)
  );

  // Clock generation
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rxdata_in = 0;
    rxctrl0_in = 0;
    rxctrl1_in = 0;

    // Wait for a few clock cycles
    #10;

    // Test case 1: Simple assignment check
    rxdata_in = 128'h0123456789ABCDEF0123456789ABCDEF; // Example data
    rxctrl0_in = 16'h0001; // Example control
    rxctrl1_in = 16'h0002; // Example control
    #10;

    if (gtwiz_userdata_rx_out !== 32'h89ABCDEF) begin
      $display("FAIL: Test case 1 failed, expected 89ABCDEF, got %h", gtwiz_userdata_rx_out);
      $finish;
    end

    // Test case 2: Check with different control signals
    rxdata_in = 128'hFEDCBA9876543210FEDCBA9876543210; // New example data
    rxctrl0_in = 16'h0003; // New control
    rxctrl1_in = 16'h0004; // New control
    #10;

    if (gtwiz_userdata_rx_out !== 32'h76543210) begin
      $display("FAIL: Test case 2 failed, expected 76543210, got %h", gtwiz_userdata_rx_out);
      $finish;
    end

    // Test case 3: Edge case with all zeros
    rxdata_in = 128'h00000000000000000000000000000000; // All zeros
    rxctrl0_in = 16'h0000; // All zeros
    rxctrl1_in = 16'h0000; // All zeros
    #10;

    if (gtwiz_userdata_rx_out !== 32'h00000000) begin
      $display("FAIL: Test case 3 failed, expected 00000000, got %h", gtwiz_userdata_rx_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule