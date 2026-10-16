`timescale 1ns/1ps

module tb_n_bit_comparator;

  reg [15:0] a;
  reg [15:0] b;
  wire lesser;
  wire greater;
  wire equal;

  // Instantiate the module under test
  n_bit_comparator uut (
    .a(a),
    .b(b),
    .lesser(lesser),
    .greater(greater),
    .equal(equal)
  );

  initial begin
    // Test case 1: a > b
    a = 16'h0001; // 1
    b = 16'h0000; // 0
    #10;
    if (lesser !== 0 || greater !== 1 || equal !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a < b
    a = 16'h0000; // 0
    b = 16'h0001; // 1
    #10;
    if (lesser !== 1 || greater !== 0 || equal !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 16'h0001; // 1
    b = 16'h0001; // 1
    #10;
    if (lesser !== 0 || greater !== 0 || equal !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a > b (larger values)
    a = 16'hFF00; // 65280
    b = 16'h00FF; // 255
    #10;
    if (lesser !== 0 || greater !== 1 || equal !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a < b (larger values)
    a = 16'h00FF; // 255
    b = 16'hFF00; // 65280
    #10;
    if (lesser !== 1 || greater !== 0 || equal !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a == b (larger values)
    a = 16'hFFFF; // 65535
    b = 16'hFFFF; // 65535
    #10;
    if (lesser !== 0 || greater !== 0 || equal !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule