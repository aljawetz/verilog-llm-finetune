`timescale 1ns/1ps

module tb_prior_encoder_4x2;
  reg [3:0] y;
  wire [1:0] a;

  // Instantiate the module under test (uut)
  prior_encoder_4x2 uut (
    .y(y),
    .a(a)
  );

  initial begin
    // Test case 1: y = 4'b1000 (y[3] is high)
    y = 4'b1000;
    #10;
    if (a !== 2'b11) begin
      $display("FAIL: Expected a = 2'b11 for y = 4'b1000, got a = %b", a);
      $finish;
    end

    // Test case 2: y = 4'b0100 (y[2] is high)
    y = 4'b0100;
    #10;
    if (a !== 2'b10) begin
      $display("FAIL: Expected a = 2'b10 for y = 4'b0100, got a = %b", a);
      $finish;
    end

    // Test case 3: y = 4'b0010 (y[1] is high)
    y = 4'b0010;
    #10;
    if (a !== 2'b01) begin
      $display("FAIL: Expected a = 2'b01 for y = 4'b0010, got a = %b", a);
      $finish;
    end

    // Test case 4: y = 4'b0001 (no high inputs)
    y = 4'b0000;
    #10;
    if (a !== 2'b00) begin
      $display("FAIL: Expected a = 2'b00 for y = 4'b0000, got a = %b", a);
      $finish;
    end

    // Test case 5: y = 4'b1111 (y[3] is high, should take priority)
    y = 4'b1111;
    #10;
    if (a !== 2'b11) begin
      $display("FAIL: Expected a = 2'b11 for y = 4'b1111, got a = %b", a);
      $finish;
    end

    // Test case 6: y = 4'b0111 (y[2] is high, should take priority over y[1])
    y = 4'b0111;
    #10;
    if (a !== 2'b10) begin
      $display("FAIL: Expected a = 2'b10 for y = 4'b0111, got a = %b", a);
      $finish;
    end

    // Test case 7: y = 4'b0001 (no high inputs)
    y = 4'b0001;
    #10;
    if (a !== 2'b00) begin
      $display("FAIL: Expected a = 2'b00 for y = 4'b0001, got a = %b", a);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule