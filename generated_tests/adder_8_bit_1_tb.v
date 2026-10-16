`timescale 1ns/1ps

module tb_adder_8_bit;

  reg clk;
  reg rst_b;
  reg [7:0] adder_in_a;
  reg [7:0] adder_in_b;
  reg carry_in;
  wire [7:0] adder_out;
  wire carry_out;

  // Instantiate the module under test (uut)
  adder_8_bit uut (
    .clk(clk),
    .rst_b(rst_b),
    .adder_in_a(adder_in_a),
    .adder_in_b(adder_in_b),
    .carry_in(carry_in),
    .adder_out(adder_out),
    .carry_out(carry_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_b = 0;
    adder_in_a = 8'd0;
    adder_in_b = 8'd0;
    carry_in = 1'b0;

    // Apply reset
    #10;
    rst_b = 1;

    // Test case 1: 5 + 3 + 0 = 8
    adder_in_a = 8'd5;
    adder_in_b = 8'd3;
    carry_in = 1'b0;
    #10;
    if (adder_out !== 8'd8 || carry_out !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 255 + 1 + 0 = 0 with carry out
    adder_in_a = 8'd255;
    adder_in_b = 8'd1;
    carry_in = 1'b0;
    #10;
    if (adder_out !== 8'd0 || carry_out !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 100 + 50 + 1 = 151
    adder_in_a = 8'd100;
    adder_in_b = 8'd50;
    carry_in = 1'b1;
    #10;
    if (adder_out !== 8'd151 || carry_out !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 0 + 0 + 0 = 0
    adder_in_a = 8'd0;
    adder_in_b = 8'd0;
    carry_in = 1'b0;
    #10;
    if (adder_out !== 8'd0 || carry_out !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Reset functionality
    rst_b = 0;
    #10;
    if (adder_out !== 8'd0 || carry_out !== 1'b1) begin
      $display("FAIL: Reset functionality failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule