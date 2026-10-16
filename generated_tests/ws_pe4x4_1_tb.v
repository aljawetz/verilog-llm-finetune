`timescale 1ns/1ps

module tb_ws_pe4x4;

  parameter bit_width = 8;
  parameter acc_width = 32;

  reg clk;
  reg control;
  reg [acc_width-1:0] acc_in;
  reg [bit_width-1:0] data_in;
  reg [bit_width-1:0] wt_path_in;
  wire [acc_width-1:0] acc_out;
  wire [bit_width-1:0] data_out;
  wire [bit_width-1:0] wt_path_out;

  // Instantiate the Unit Under Test (UUT)
  ws_pe4x4 #(bit_width, acc_width) uut (
    .clk(clk),
    .control(control),
    .acc_in(acc_in),
    .acc_out(acc_out),
    .data_in(data_in),
    .wt_path_in(wt_path_in),
    .data_out(data_out),
    .wt_path_out(wt_path_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  initial begin
    // Initialize inputs
    control = 0;
    acc_in = 32'h0;
    data_in = 8'h0;
    wt_path_in = 8'h0;

    // Test 1: Load weights
    control = 1;
    wt_path_in = 8'hA5; // Load weight
    #10; // Wait for one clock cycle

    if (data_out !== 8'h0 || acc_out !== 32'h0 || wt_path_out !== 8'hA5) begin
      $display("FAIL: Weight loading failed");
      $finish;
    end

    // Test 2: Perform MAC operation
    control = 0;
    acc_in = 32'h10; // Accumulation input
    data_in = 8'h02; // Data input
    #10; // Wait for one clock cycle

    if (data_out !== 8'h02 || acc_out !== (32'h10 + 8'h02 * 8'hA5)) begin
      $display("FAIL: MAC operation failed");
      $finish;
    end

    // Test 3: Reset and load new weight
    control = 1;
    wt_path_in = 8'h3C; // Load new weight
    #10; // Wait for one clock cycle

    if (data_out !== 8'h0 || acc_out !== 32'h0 || wt_path_out !== 8'h3C) begin
      $display("FAIL: Weight loading failed on reset");
      $finish;
    end

    // Test 4: Perform MAC operation with new weight
    control = 0;
    acc_in = 32'h20; // New accumulation input
    data_in = 8'h04; // New data input
    #10; // Wait for one clock cycle

    if (data_out !== 8'h04 || acc_out !== (32'h20 + 8'h04 * 8'h3C)) begin
      $display("FAIL: MAC operation failed with new weight");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule