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
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    gtwiz_userdata_tx_in = 0;

    // Wait for a clock cycle
    @(posedge clk);

    // Test case 1: Check output for a specific input
    gtwiz_userdata_tx_in = 32'hA5A5A5A5; // Example input
    @(posedge clk);
    
    // Check expected outputs
    if (txdata_out !== 128'h00000000_00000000_00000000_A5A5A5A5) begin
      $display("FAIL: Test case 1 failed, expected txdata_out = 128'h00000000_00000000_00000000_A5A5A5A5, got txdata_out = %h", txdata_out);
      $finish;
    end

    if (txctrl0_out !== 16'h0000) begin
      $display("FAIL: Test case 1 failed, expected txctrl0_out = 16'h0000, got txctrl0_out = %h", txctrl0_out);
      $finish;
    end

    if (txctrl1_out !== 16'h0000) begin
      $display("FAIL: Test case 1 failed, expected txctrl1_out = 16'h0000, got txctrl1_out = %h", txctrl1_out);
      $finish;
    end

    // Test case 2: Check output for another input
    gtwiz_userdata_tx_in = 32'hFFFFFFFF; // Another example input
    @(posedge clk);
    
    // Check expected outputs
    if (txdata_out !== 128'h00000000_00000000_00000000_FFFFFFFF) begin
      $display("FAIL: Test case 2 failed, expected txdata_out = 128'h00000000_00000000_00000000_FFFFFFFF, got txdata_out = %h", txdata_out);
      $finish;
    end

    if (txctrl0_out !== 16'h0000) begin
      $display("FAIL: Test case 2 failed, expected txctrl0_out = 16'h0000, got txctrl0_out = %h", txctrl0_out);
      $finish;
    end

    if (txctrl1_out !== 16'h0000) begin
      $display("FAIL: Test case 2 failed, expected txctrl1_out = 16'h0000, got txctrl1_out = %h", txctrl1_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule