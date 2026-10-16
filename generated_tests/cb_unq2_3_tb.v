`timescale 1ns/1ps

module tb_cb_unq2;

  reg clk;
  reg reset;
  reg config_en;
  reg [31:0] config_data;
  reg [31:0] config_addr;
  wire out;
  reg in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8, in_9, in_10, in_11, in_12, in_13;
  wire [31:0] read_data;

  // Instantiate the Unit Under Test (UUT)
  cb_unq2 uut (
    .clk(clk),
    .reset(reset),
    .config_en(config_en),
    .config_data(config_data),
    .config_addr(config_addr),
    .out(out),
    .in_0(in_0),
    .in_1(in_1),
    .in_2(in_2),
    .in_3(in_3),
    .in_4(in_4),
    .in_5(in_5),
    .in_6(in_6),
    .in_7(in_7),
    .in_8(in_8),
    .in_9(in_9),
    .in_10(in_10),
    .in_11(in_11),
    .in_12(in_12),
    .in_13(in_13),
    .read_data(read_data)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    config_en = 0;
    config_data = 32'b0;
    config_addr = 32'b0;
    in_0 = 0; in_1 = 0; in_2 = 0; in_3 = 0; in_4 = 0; in_5 = 0; in_6 = 0; in_7 = 0;
    in_8 = 0; in_9 = 0; in_10 = 0; in_11 = 0; in_12 = 0; in_13 = 0;

    // Release reset
    #10 reset = 0;

    // Check default output (should select input 13)
    in_13 = 1; // Set input 13 high
    #10;
    if (out !== 1) begin
      $display("FAIL: Default output should be 1 from input 13");
      $finish;
    end

    // Test configuration
    config_en = 1;
    config_addr = 32'h00000000; // Address for config
    config_data = 32'd5; // Select input 5
    #10;

    // Check output after configuration
    in_5 = 1; // Set input 5 high
    #10;
    if (out !== 1) begin
      $display("FAIL: Output should be 1 from input 5 after configuration");
      $finish;
    end

    // Test another configuration
    config_data = 32'd10; // Select input 10
    #10;

    // Check output after new configuration
    in_10 = 1; // Set input 10 high
    #10;
    if (out !== 1) begin
      $display("FAIL: Output should be 1 from input 10 after configuration");
      $finish;
    end

    // Test reset functionality
    reset = 1; // Assert reset
    #10;
    reset = 0; // Deassert reset
    #10;

    // Check output after reset (should select input 13 again)
    if (out !== 1) begin
      $display("FAIL: Output should be 1 from input 13 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule