`timescale 1ns/1ps

module tb_n_bit_comparator;

  reg [7:0] a;
  reg [7:0] b;
  wire lesser;
  wire greater;
  wire equal;

  // Instantiate the module under test (uut)
  n_bit_comparator uut (
    .a(a),
    .b(b),
    .lesser(lesser),
    .greater(greater),
    .equal(equal)
  );

  initial begin
    // Test case 1: a < b
    a = 8'b00000001; // 1
    b = 8'b00000010; // 2
    #10;
    if (lesser !== 1'b1 || greater !== 1'b0 || equal !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a > b
    a = 8'b00000010; // 2
    b = 8'b00000001; // 1
    #10;
    if (lesser !== 1'b0 || greater !== 1'b1 || equal !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 8'b00000001; // 1
    b = 8'b00000001; // 1
    #10;
    if (lesser !== 1'b0 || greater !== 1'b0 || equal !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a < b (different values)
    a = 8'b00001111; // 15
    b = 8'b00010000; // 16
    #10;
    if (lesser !== 1'b1 || greater !== 1'b0 || equal !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a > b (different values)
    a = 8'b00010000; // 16
    b = 8'b00001111; // 15
    #10;
    if (lesser !== 1'b0 || greater !== 1'b1 || equal !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a == b (different values)
    a = 8'b11111111; // 255
    b = 8'b11111111; // 255
    #10;
    if (lesser !== 1'b0 || greater !== 1'b0 || equal !== 1'b1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule