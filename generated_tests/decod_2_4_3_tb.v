`timescale 1ns/1ps

module tb_decod_2_4;

  reg a;
  reg b;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  decod_2_4 uut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (y !== 4'b0010) $display("FAIL: Test case 1 failed, expected 0010, got %b", y);

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (y !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", y);

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (y !== 4'b0100) $display("FAIL: Test case 3 failed, expected 0100, got %b", y);

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (y !== 4'b1000) $display("FAIL: Test case 4 failed, expected 1000, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule