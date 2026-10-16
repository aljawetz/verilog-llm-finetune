`timescale 1ns/1ps

module tb_n_bit_comparator;

  reg [7:0] a, b;
  wire greater, equal, lesser, not_equal;

  // Instantiate the module under test
  n_bit_comparator #(8) uut (
    .a(a),
    .b(b),
    .greater(greater),
    .equal(equal),
    .lesser(lesser),
    .not_equal(not_equal)
  );

  initial begin
    // Test case 1: a > b
    a = 8'b00001111; // 15
    b = 8'b00000111; // 7
    #10;
    if (greater !== 1 || equal !== 0 || lesser !== 0 || not_equal !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a < b
    a = 8'b00000111; // 7
    b = 8'b00001111; // 15
    #10;
    if (greater !== 0 || equal !== 0 || lesser !== 1 || not_equal !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 8'b00001111; // 15
    b = 8'b00001111; // 15
    #10;
    if (greater !== 0 || equal !== 1 || lesser !== 0 || not_equal !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 0, b = 0
    a = 8'b00000000; // 0
    b = 8'b00000000; // 0
    #10;
    if (greater !== 0 || equal !== 1 || lesser !== 0 || not_equal !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a = 255, b = 0
    a = 8'b11111111; // 255
    b = 8'b00000000; // 0
    #10;
    if (greater !== 1 || equal !== 0 || lesser !== 0 || not_equal !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a = 0, b = 255
    a = 8'b00000000; // 0
    b = 8'b11111111; // 255
    #10;
    if (greater !== 0 || equal !== 0 || lesser !== 1 || not_equal !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule