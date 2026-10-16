`timescale 1ns/1ps

module tb_mux_2x1;

  reg a;
  reg b;
  reg sel;
  wire y;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Test case 1: sel = 0, a = 0, b = 0 -> y should be 0
    a = 0; b = 0; sel = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);

    // Test case 2: sel = 0, a = 1, b = 0 -> y should be 1
    a = 1; b = 0; sel = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);

    // Test case 3: sel = 0, a = 0, b = 1 -> y should be 0
    a = 0; b = 1; sel = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);

    // Test case 4: sel = 1, a = 0, b = 0 -> y should be 0
    a = 0; b = 0; sel = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 4 failed, expected y = 0, got y = %b", y);

    // Test case 5: sel = 1, a = 1, b = 0 -> y should be 0
    a = 1; b = 0; sel = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 5 failed, expected y = 0, got y = %b", y);

    // Test case 6: sel = 1, a = 0, b = 1 -> y should be 1
    a = 0; b = 1; sel = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed, expected y = 1, got y = %b", y);

    // Test case 7: sel = 1, a = 1, b = 1 -> y should be 1
    a = 1; b = 1; sel = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 7 failed, expected y = 1, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule