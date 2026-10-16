`timescale 1ns/1ps

module tb_dmux12;

  reg i;
  reg sel;
  wire o0;
  wire o1;

  // Instantiate the module under test (uut)
  dmux12 uut (
    .i(i),
    .sel(sel),
    .o0(o0),
    .o1(o1)
  );

  initial begin
    // Test case 1: sel = 0, i = 0
    i = 0; sel = 0;
    #10;
    if (o0 !== 0 || o1 !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: sel = 0, i = 1
    i = 1; sel = 0;
    #10;
    if (o0 !== 1 || o1 !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: sel = 1, i = 0
    i = 0; sel = 1;
    #10;
    if (o0 !== 0 || o1 !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: sel = 1, i = 1
    i = 1; sel = 1;
    #10;
    if (o0 !== 0 || o1 !== 1) $display("FAIL: Test case 4 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule