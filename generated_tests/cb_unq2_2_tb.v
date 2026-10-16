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
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    config_en = 0;
    config_data = 0;
    config_addr = 0;
    in_0 = 0; in_1 = 0; in_2 = 0; in_3 = 0; in_4 = 0; in_5 = 0; in_6 = 0; in_7 = 0;
    in_8 = 0; in_9 = 0; in_10 = 0; in_11 = 0; in_12 = 0; in_13 = 0;

    // Release reset
    #10 reset = 0;

    // Test case 1: Check default output after reset
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Default output after reset should be 0");
      $finish;
    end

    // Test case 2: Configure to select in_0
    config_addr = 32'h00000000; // Address for configuration
    config_data = 32'h00000000; // Select in_0
    config_en = 1;
    #10 config_en = 0; // Disable config_en

    in_0 = 1; // Set in_0 to 1
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 when in_0 is selected");
      $finish;
    end

    // Test case 3: Configure to select in_1
    config_data = 32'h00000001; // Select in_1
    config_en = 1;
    #10 config_en = 0;

    in_1 = 1; // Set in_1 to 1
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 when in_1 is selected");
      $finish;
    end

    // Test case 4: Configure to select in_2
    config_data = 32'h00000002; // Select in_2
    config_en = 1;
    #10 config_en = 0;

    in_2 = 1; // Set in_2 to 1
    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 when in_2 is selected");
      $finish;
    end

    // Test case 5: Check read_data for config_cb
    config_addr = 32'h00000000; // Address for readback
    #10;
    if (read_data !== 32'h00000002) begin
      $display("FAIL: Read data should be 0x00000002 after configuring to select in_2");
      $finish;
    end

    // Test case 6: Reset the module
    reset = 1;
    #10 reset = 0;

    // Check output after reset
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule