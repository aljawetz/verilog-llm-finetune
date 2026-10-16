`timescale 1ns/1ps

module tb_normal_multiplier;

  reg clk;
  reg rst_n;
  reg en;
  reg [7:0] a;
  reg [7:0] b;
  wire [15:0] m;

  // Instantiate the module under test (uut)
  normal_multiplier uut (
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .a(a),
    .b(b),
    .m(m)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    en = 0;
    a = 0;
    b = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test case 1: 3 * 4 = 12
    en = 1;
    a = 8'd3;
    b = 8'd4;
    #10;
    if (m !== 16'd12) begin
      $display("FAIL: Expected 12, got %d", m);
      $finish;
    end

    // Test case 2: 5 * 6 = 30
    a = 8'd5;
    b = 8'd6;
    #10;
    if (m !== 16'd30) begin
      $display("FAIL: Expected 30, got %d", m);
      $finish;
    end

    // Test case 3: 7 * 8 = 56
    a = 8'd7;
    b = 8'd8;
    #10;
    if (m !== 16'd56) begin
      $display("FAIL: Expected 56, got %d", m);
      $finish;
    end

    // Test case 4: 0 * 10 = 0
    a = 8'd0;
    b = 8'd10;
    #10;
    if (m !== 16'd0) begin
      $display("FAIL: Expected 0, got %d", m);
      $finish;
    end

    // Test case 5: 15 * 15 = 225
    a = 8'd15;
    b = 8'd15;
    #10;
    if (m !== 16'd225) begin
      $display("FAIL: Expected 225, got %d", m);
      $finish;
    end

    // Test case 6: 255 * 255 = 65025
    a = 8'd255;
    b = 8'd255;
    #10;
    if (m !== 16'd65025) begin
      $display("FAIL: Expected 65025, got %d", m);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule