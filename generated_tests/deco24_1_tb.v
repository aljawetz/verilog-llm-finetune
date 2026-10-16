`timescale 1ns/1ps

module tb_deco24;
  reg a;
  reg b;
  wire [3:0] p;

  // Instantiate the module under test (uut)
  deco24 uut (
    .a(a),
    .b(b),
    .p(p)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (p !== 4'b0001) $display("FAIL: Test case 1 failed, expected 0001, got %b", p);

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (p !== 4'b0010) $display("FAIL: Test case 2 failed, expected 0010, got %b", p);

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (p !== 4'b0100) $display("FAIL: Test case 3 failed, expected 0100, got %b", p);

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (p !== 4'b1000) $display("FAIL: Test case 4 failed, expected 1000, got %b", p);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule