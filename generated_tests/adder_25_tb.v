`timescale 1ns/1ps

module tb_adder;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] sum_result;

  // Instantiate the adder module
  adder uut (
    .a(a),
    .b(b),
    .sum_result(sum_result)
  );

  initial begin
    // Test case 1: 0 + 0
    a = 8'd0; b = 8'd0;
    #10;
    if (sum_result !== 8'd0) $display("FAIL: Test case 1 failed, expected 0, got %d", sum_result);

    // Test case 2: 5 + 3
    a = 8'd5; b = 8'd3;
    #10;
    if (sum_result !== 8'd8) $display("FAIL: Test case 2 failed, expected 8, got %d", sum_result);

    // Test case 3: 255 + 1 (overflow case)
    a = 8'd255; b = 8'd1;
    #10;
    if (sum_result !== 8'd0) $display("FAIL: Test case 3 failed, expected 0, got %d", sum_result);

    // Test case 4: 100 + 50
    a = 8'd100; b = 8'd50;
    #10;
    if (sum_result !== 8'd150) $display("FAIL: Test case 4 failed, expected 150, got %d", sum_result);

    // Test case 5: 200 + 55
    a = 8'd200; b = 8'd55;
    #10;
    if (sum_result !== 8'd255) $display("FAIL: Test case 5 failed, expected 255, got %d", sum_result);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule