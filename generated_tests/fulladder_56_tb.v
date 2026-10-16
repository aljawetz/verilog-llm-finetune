`timescale 1ns/1ps

module tb_fulladder;

  reg a, b, ic;
  wire o, oc;

  // Instantiate the full adder module
  fulladder uut (
    .a(a),
    .b(b),
    .ic(ic),
    .o(o),
    .oc(oc)
  );

  initial begin
    // Test case 1: a=0, b=0, ic=0
    a = 0; b = 0; ic = 0; #10;
    if (o !== 0 || oc !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: a=0, b=0, ic=1
    a = 0; b = 0; ic = 1; #10;
    if (o !== 1 || oc !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: a=0, b=1, ic=0
    a = 0; b = 1; ic = 0; #10;
    if (o !== 1 || oc !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: a=0, b=1, ic=1
    a = 0; b = 1; ic = 1; #10;
    if (o !== 0 || oc !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: a=1, b=0, ic=0
    a = 1; b = 0; ic = 0; #10;
    if (o !== 1 || oc !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: a=1, b=0, ic=1
    a = 1; b = 0; ic = 1; #10;
    if (o !== 0 || oc !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: a=1, b=1, ic=0
    a = 1; b = 1; ic = 0; #10;
    if (o !== 0 || oc !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: a=1, b=1, ic=1
    a = 1; b = 1; ic = 1; #10;
    if (o !== 1 || oc !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule