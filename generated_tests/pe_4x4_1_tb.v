`timescale 1ns/1ps

module tb_pe_4x4;

  parameter bit_width = 8;
  parameter acc_width = 32;

  reg clk;
  reg control;
  reg [acc_width-1:0] acc_in;
  reg [bit_width-1:0] data_in;
  reg [bit_width-1:0] wt_path_in;
  wire [acc_width-1:0] acc_out;
  wire [bit_width-1:0] data_out;

  // Instantiate the module under test (uut)
  pe_4x4 #(bit_width, acc_width) uut (
    .clk(clk),
    .control(control),
    .acc_in(acc_in),
    .acc_out(acc_out),
    .data_in(data_in),
    .wt_path_in(wt_path_in),
    .data_out(data_out)
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

    // Test 1: Load weight and reset outputs
    control = 1; // Activate control
    wt_path_in = 8'h03; // Load weight 3
    #10; // Wait for one clock cycle
    control = 0; // Deactivate control
    #10; // Wait for one clock cycle

    // Check outputs after loading weight
    if (data_out !== 8'h0) begin
      $display("FAIL: data_out should be 0 after loading weight");
      $finish;
    end
    if (acc_out !== 32'h0) begin
      $display("FAIL: acc_out should be 0 after loading weight");
      $finish;
    end

    // Test 2: Multiply and accumulate
    data_in = 8'h04; // Input data 4
    acc_in = 32'h0; // Initial accumulator value
    #10; // Wait for one clock cycle

    // Check outputs after multiplication
    if (data_out !== 8'h04) begin
      $display("FAIL: data_out should be 4 after multiplication");
      $finish;
    end
    if (acc_out !== (32'h0 + 8'h04 * 8'h03)) begin
      $display("FAIL: acc_out should be 12 after multiplication");
      $finish;
    end

    // Test 3: Accumulate with a new input
    data_in = 8'h02; // New input data 2
    acc_in = acc_out; // Use the current acc_out as acc_in
    #10; // Wait for one clock cycle

    // Check outputs after second multiplication
    if (data_out !== 8'h02) begin
      $display("FAIL: data_out should be 2 after second multiplication");
      $finish;
    end
    if (acc_out !== (12 + 8'h02 * 8'h03)) begin
      $display("FAIL: acc_out should be 18 after second multiplication");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule