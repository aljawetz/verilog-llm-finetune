`timescale 1ns/1ps

module tb_n_bit_comparator;

  reg [7:0] a;
  reg [7:0] b;
  wire greater;
  wire equal;
  wire lesser;
  wire not_equal;

  // Instantiate the module under test (uut)
  n_bit_comparator uut (
    .a(a),
    .b(b),
    .greater(greater),
    .equal(equal),
    .lesser(lesser),
    .not_equal(not_equal)
  );

  initial begin
    // Test case 1: a > b
    a = 8'd10; 
    b = 8'd5; 
    #10;
    if (greater !== 1 || equal !== 0 || lesser !== 0 || not_equal !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a < b
    a = 8'd3; 
    b = 8'd7; 
    #10;
    if (greater !== 0 || equal !== 0 || lesser !== 1 || not_equal !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a == b
    a = 8'd4; 
    b = 8'd4; 
    #10;
    if (greater !== 0 || equal !== 1 || lesser !== 0 || not_equal !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a > b (boundary case)
    a = 8'd255; 
    b = 8'd0; 
    #10;
    if (greater !== 1 || equal !== 0 || lesser !== 0 || not_equal !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: a < b (boundary case)
    a = 8'd0; 
    b = 8'd255; 
    #10;
    if (greater !== 0 || equal !== 0 || lesser !== 1 || not_equal !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: a == b (boundary case)
    a = 8'd128; 
    b = 8'd128; 
    #10;
    if (greater !== 0 || equal !== 1 || lesser !== 0 || not_equal !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule