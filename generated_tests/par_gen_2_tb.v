`timescale 1ns/1ps

module tb_par_gen;
  reg x, y, z;
  wire result;

  // Instantiate the module under test
  par_gen uut (
    .x(x),
    .y(y),
    .z(z),
    .result(result)
  );

  initial begin
    // Test case 1: x = 0, y = 0, z = 0; expected result = 0
    x = 0; y = 0; z = 0;
    #10;
    if (result !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", result);

    // Test case 2: x = 0, y = 0, z = 1; expected result = 1
    x = 0; y = 0; z = 1;
    #10;
    if (result !== 1) $display("FAIL: Test case 2 failed, expected 1, got %b", result);

    // Test case 3: x = 0, y = 1, z = 0; expected result = 1
    x = 0; y = 1; z = 0;
    #10;
    if (result !== 1) $display("FAIL: Test case 3 failed, expected 1, got %b", result);

    // Test case 4: x = 0, y = 1, z = 1; expected result = 0
    x = 0; y = 1; z = 1;
    #10;
    if (result !== 0) $display("FAIL: Test case 4 failed, expected 0, got %b", result);

    // Test case 5: x = 1, y = 0, z = 0; expected result = 1
    x = 1; y = 0; z = 0;
    #10;
    if (result !== 1) $display("FAIL: Test case 5 failed, expected 1, got %b", result);

    // Test case 6: x = 1, y = 0, z = 1; expected result = 0
    x = 1; y = 0; z = 1;
    #10;
    if (result !== 0) $display("FAIL: Test case 6 failed, expected 0, got %b", result);

    // Test case 7: x = 1, y = 1, z = 0; expected result = 0
    x = 1; y = 1; z = 0;
    #10;
    if (result !== 0) $display("FAIL: Test case 7 failed, expected 0, got %b", result);

    // Test case 8: x = 1, y = 1, z = 1; expected result = 1
    x = 1; y = 1; z = 1;
    #10;
    if (result !== 1) $display("FAIL: Test case 8 failed, expected 1, got %b", result);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule