`timescale 1ns/1ps

module tb_dec;

  reg a;
  reg b;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  dec uut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    // Test case 1: a=0, b=0 -> y should be 0001
    a = 0; b = 0; #10;
    if (y !== 4'b0001) $display("FAIL: Test case 1 failed (a=0, b=0)");

    // Test case 2: a=0, b=1 -> y should be 0010
    a = 0; b = 1; #10;
    if (y !== 4'b0010) $display("FAIL: Test case 2 failed (a=0, b=1)");

    // Test case 3: a=1, b=0 -> y should be 0100
    a = 1; b = 0; #10;
    if (y !== 4'b0100) $display("FAIL: Test case 3 failed (a=1, b=0)");

    // Test case 4: a=1, b=1 -> y should be 1000
    a = 1; b = 1; #10;
    if (y !== 4'b1000) $display("FAIL: Test case 4 failed (a=1, b=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule