`timescale 1ns/1ps

module tb_decoder1;

  reg en;
  reg a;
  reg b;
  wire d0, d1, d2, d3;

  // Instantiate the module under test (uut)
  decoder1 uut (
    .en(en),
    .a(a),
    .b(b),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
  );

  initial begin
    // Test case 1: Enable decoder and input (0, 0)
    en = 1;
    a = 0;
    b = 0;
    #10;
    if (d0 !== 1'b1 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Enable decoder and input (0, 1)
    a = 0;
    b = 1;
    #10;
    if (d0 !== 1'b0 || d1 !== 1'b1 || d2 !== 1'b0 || d3 !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Enable decoder and input (1, 0)
    a = 1;
    b = 0;
    #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b1 || d3 !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Enable decoder and input (1, 1)
    a = 1;
    b = 1;
    #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Disable decoder
    en = 0;
    #10;
    if (d0 !== 1'b0 || d1 !== 1'b0 || d2 !== 1'b0 || d3 !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule