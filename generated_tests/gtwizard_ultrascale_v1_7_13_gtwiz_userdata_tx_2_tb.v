`timescale 1ns/1ps

module tb_gtwizard_ultrascale_v1_7_13_gtwiz_userdata_tx;

  parameter integer P_TX_USER_DATA_WIDTH       = 32;
  parameter integer P_TOTAL_NUMBER_OF_CHANNELS = 1;

  reg [(P_TOTAL_NUMBER_OF_CHANNELS*P_TX_USER_DATA_WIDTH)-1:0] gtwiz_userdata_tx_in;
  wire [(P_TOTAL_NUMBER_OF_CHANNELS*128)-1:0]                  txdata_out;
  wire [(P_TOTAL_NUMBER_OF_CHANNELS*16)-1:0]                   txctrl0_out;
  wire [(P_TOTAL_NUMBER_OF_CHANNELS*16)-1:0]                   txctrl1_out;

  // Instantiate the module under test
  gtwizard_ultrascale_v1_7_13_gtwiz_userdata_tx #(
    .P_TX_USER_DATA_WIDTH(P_TX_USER_DATA_WIDTH),
    .P_TOTAL_NUMBER_OF_CHANNELS(P_TOTAL_NUMBER_OF_CHANNELS)
  ) uut (
    .gtwiz_userdata_tx_in(gtwiz_userdata_tx_in),
    .txdata_out(txdata_out),
    .txctrl0_out(txctrl0_out),
    .txctrl1_out(txctrl1_out)
  );

  // Clock generation
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Test case 1: Check with all zeros
    gtwiz_userdata_tx_in = 0;
    #10;
    if (txdata_out !== 0 || txctrl0_out !== 0 || txctrl1_out !== 0) begin
      $display("FAIL: Test case 1 failed with all zeros");
      $finish;
    end

    // Test case 2: Check with some data
    gtwiz_userdata_tx_in = 32'hA5A5A5A5; // Example data
    #10;
    if (txdata_out !== 128'h00000000_00000000_00000000_A5A5A5A5 || 
        txctrl0_out !== 16'h0000 || 
        txctrl1_out !== 16'h0000) begin
      $display("FAIL: Test case 2 failed with data A5A5A5A5");
      $finish;
    end

    // Test case 3: Check with maximum data width
    gtwiz_userdata_tx_in = 32'hFFFFFFFF; // Example data
    #10;
    if (txdata_out !== 128'h00000000_00000000_00000000_FFFFFFFF || 
        txctrl0_out !== 16'h0000 || 
        txctrl1_out !== 16'h0000) begin
      $display("FAIL: Test case 3 failed with data FFFFFFFF");
      $finish;
    end

    // Test case 4: Check with another pattern
    gtwiz_userdata_tx_in = 32'h12345678; // Example data
    #10;
    if (txdata_out !== 128'h00000000_00000000_00000000_12345678 || 
        txctrl0_out !== 16'h0000 || 
        txctrl1_out !== 16'h0000) begin
      $display("FAIL: Test case 4 failed with data 12345678");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule