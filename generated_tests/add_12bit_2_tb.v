`timescale 1ns/1ps

module tb_add_12bit;

  reg [11:0] a;
  reg [11:0] b;
  wire [11:0] sum;

  // Instantiate the module under test (uut)
  add_12bit uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    // Test case 1: 0 + 0
    a = 12'd0; b = 12'd0;
    #10;
    if (sum !== 12'd0) $display("FAIL: Test case 1 failed, expected 0, got %d", sum);

    // Test case 2: 1 + 1
    a = 12'd1; b = 12'd1;
    #10;
    if (sum !== 12'd2) $display("FAIL: Test case 2 failed, expected 2, got %d", sum);

    // Test case 3: 4095 + 1 (max value + 1)
    a = 12'd4095; b = 12'd1;
    #10;
    if (sum !== 12'd0) $display("FAIL: Test case 3 failed, expected 0 (overflow), got %d", sum);

    // Test case 4: 2048 + 2048
    a = 12'd2048; b = 12'd2048;
    #10;
    if (sum !== 12'd4096) $display("FAIL: Test case 4 failed, expected 4096, got %d", sum);

    // Test case 5: 1234 + 567
    a = 12'd1234; b = 12'd567;
    #10;
    if (sum !== 12'd1801) $display("FAIL: Test case 5 failed, expected 1801, got %d", sum);

    // Test case 6: 3000 + 1000
    a = 12'd3000; b = 12'd1000;
    #10;
    if (sum !== 12'd4000) $display("FAIL: Test case 6 failed, expected 4000, got %d", sum);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule