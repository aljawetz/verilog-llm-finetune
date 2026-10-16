`timescale 1ns/1ps

module tb_jfulladder;

  reg a, b, carryin;
  wire y, carryout;

  // Instantiate the module under test (uut)
  jfulladder uut (
    .y(y),
    .carryout(carryout),
    .a(a),
    .b(b),
    .carryin(carryin)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, carryout = 0
    a = 0; b = 0; carryin = 0;
    #10;
    if (y !== 0 || carryout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, carryout = 0
    a = 0; b = 0; carryin = 1;
    #10;
    if (y !== 1 || carryout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, carryout = 0
    a = 0; b = 1; carryin = 0;
    #10;
    if (y !== 1 || carryout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 = 0, carryout = 1
    a = 0; b = 1; carryin = 1;
    #10;
    if (y !== 0 || carryout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 = 1, carryout = 0
    a = 1; b = 0; carryin = 0;
    #10;
    if (y !== 1 || carryout !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, carryout = 1
    a = 1; b = 0; carryin = 1;
    #10;
    if (y !== 0 || carryout !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0 = 0, carryout = 1
    a = 1; b = 1; carryin = 0;
    #10;
    if (y !== 0 || carryout !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, carryout = 1
    a = 1; b = 1; carryin = 1;
    #10;
    if (y !== 1 || carryout !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule