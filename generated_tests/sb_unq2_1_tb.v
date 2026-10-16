`timescale 1ns/1ps

module tb_sb_unq2;

  reg clk;
  reg clk_en;
  reg reset;
  reg config_en;
  reg [31:0] config_data;
  reg [31:0] config_addr;
  reg pe_output_0;
  reg [0:0] in_0_0, in_0_1, in_0_2, in_0_3, in_0_4;
  reg [0:0] in_1_0, in_1_1, in_1_2, in_1_3, in_1_4;
  reg [0:0] in_2_0, in_2_1, in_2_2, in_2_3, in_2_4;
  reg [0:0] in_3_0, in_3_1, in_3_2, in_3_3, in_3_4;
  
  wire out_0_0, out_0_1, out_0_2, out_0_3, out_0_4;
  wire out_1_0, out_1_1, out_1_2, out_1_3, out_1_4;
  wire out_2_0, out_2_1, out_2_2, out_2_3, out_2_4;
  wire out_3_0, out_3_1, out_3_2, out_3_3, out_3_4;
  wire [31:0] read_data;

  sb_unq2 uut (
    .clk(clk),
    .clk_en(clk_en),
    .reset(reset),
    .config_en(config_en),
    .config_data(config_data),
    .config_addr(config_addr),
    .pe_output_0(pe_output_0),
    .out_0_0(out_0_0),
    .in_0_0(in_0_0),
    .out_0_1(out_0_1),
    .in_0_1(in_0_1),
    .out_0_2(out_0_2),
    .in_0_2(in_0_2),
    .out_0_3(out_0_3),
    .in_0_3(in_0_3),
    .out_0_4(out_0_4),
    .in_0_4(in_0_4),
    .out_1_0(out_1_0),
    .in_1_0(in_1_0),
    .out_1_1(out_1_1),
    .in_1_1(in_1_1),
    .out_1_2(out_1_2),
    .in_1_2(in_1_2),
    .out_1_3(out_1_3),
    .in_1_3(in_1_3),
    .out_1_4(out_1_4),
    .in_1_4(in_1_4),
    .out_2_0(out_2_0),
    .in_2_0(in_2_0),
    .out_2_1(out_2_1),
    .in_2_1(in_2_1),
    .out_2_2(out_2_2),
    .in_2_2(in_2_2),
    .out_2_3(out_2_3),
    .in_2_3(in_2_3),
    .out_2_4(out_2_4),
    .in_2_4(in_2_4),
    .out_3_0(out_3_0),
    .in_3_0(in_3_0),
    .out_3_1(out_3_1),
    .in_3_1(in_3_1),
    .out_3_2(out_3_2),
    .in_3_2(in_3_2),
    .out_3_3(out_3_3),
    .in_3_3(in_3_3),
    .out_3_4(out_3_4),
    .in_3_4(in_3_4),
    .read_data(read_data)
  );

  initial begin
    // Initialize signals
    clk = 0;
    clk_en = 1;
    reset = 1;
    config_en = 0;
    config_data = 0;
    config_addr = 0;
    pe_output_0 = 0;
    in_0_0 = 0; in_0_1 = 0; in_0_2 = 0; in_0_3 = 0; in_0_4 = 0;
    in_1_0 = 0; in_1_1 = 0; in_1_2 = 0; in_1_3 = 0; in_1_4 = 0;
    in_2_0 = 0; in_2_1 = 0; in_2_2 = 0; in_2_3 = 0; in_2_4 = 0;
    in_3_0 = 0; in_3_1 = 0; in_3_2 = 0; in_3_3 = 0; in_3_4 = 0;

    // Release reset
    #10 reset = 0;

    // Test case 1: Check default output after reset
    #10;
    if (out_0_0 !== 1'b0) $display("FAIL: Default output out_0_0 should be 0 after reset");
    if (out_1_0 !== 1'b0) $display("FAIL: Default output out_1_0 should be 0 after reset");

    // Test case 2: Configure switch box
    config_addr = 32'h00000000; // Select config for out_0_0
    config_data = 32'h00000001; // Select in_2_0
    config_en = 1;
    #10 config_en = 0;

    // Drive inputs
    in_2_0 = 1;
    #10;
    if (out_0_0 !== 1'b1) $display("FAIL: out_0_0 should be 1 when in_2_0 is selected");

    // Test case 3: Change configuration
    config_addr = 32'h00000001; // Select config for out_0_1
    config_data = 32'h00000002; // Select in_3_1
    config_en = 1;
    #10 config_en = 0;

    in_3_1 = 1;
    #10;
    if (out_0_1 !== 1'b1) $display("FAIL: out_0_1 should be 1 when in_3_1 is selected");

    // Test case 4: Test pe_output_0
    config_addr = 32'h00000000; // Select config for out_0_0
    config_data = 32'h00000003; // Select pe_output_0
    config_en = 1;
    #10 config_en = 0;

    pe_output_0 = 1;
    #10;
    if (out_0_0 !== 1'b1) $display("FAIL: out_0_0 should be 1 when pe_output_0 is selected");

    // Test case 5: Test ungate functionality
    config_addr = 32'h00000002; // Select ungate config
    config_data = 32'h00000001; // Enable ungate for out_0_0
    config_en = 1;
    #10 config_en = 0;

    in_2_0 = 0; // Change input
    #10;
    if (out_0_0 !== 1'b1) $display("FAIL: out_0_0 should remain 1 due to ungate");

    // End simulation
    $display("PASS");
    $finish;
  end

  always #5 clk = ~clk; // Clock generation

endmodule