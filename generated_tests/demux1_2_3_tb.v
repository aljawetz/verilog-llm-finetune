`timescale 1ns/1ps

module tb_demux1_2;

  reg s;
  reg y;
  reg e;
  wire i0;
  wire i1;

  // Instantiate the module under test (uut)
  demux1_2 uut (
    .s(s),
    .y(y),
    .e(e),
    .i0(i0),
    .i1(i1)
  );

  initial begin
    // Test sequence
    // Test case 1: Enable high, select 0, input high
    e = 1; s = 0; y = 1; #10;
    if (i0 !== 1 || i1 !== 0) $display("FAIL: Test case 1 failed (e=1, s=0, y=1)"); 

    // Test case 2: Enable high, select 1, input high
    e = 1; s = 1; y = 1; #10;
    if (i0 !== 0 || i1 !== 1) $display("FAIL: Test case 2 failed (e=1, s=1, y=1)"); 

    // Test case 3: Enable low, select 0, input high
    e = 0; s = 0; y = 1; #10;
    if (i0 !== 0 || i1 !== 0) $display("FAIL: Test case 3 failed (e=0, s=0, y=1)"); 

    // Test case 4: Enable high, select 0, input low
    e = 1; s = 0; y = 0; #10;
    if (i0 !== 0 || i1 !== 0) $display("FAIL: Test case 4 failed (e=1, s=0, y=0)"); 

    // Test case 5: Enable high, select 1, input low
    e = 1; s = 1; y = 0; #10;
    if (i0 !== 0 || i1 !== 0) $display("FAIL: Test case 5 failed (e=1, s=1, y=0)"); 

    // Test case 6: Enable low, select 1, input low
    e = 0; s = 1; y = 0; #10;
    if (i0 !== 0 || i1 !== 0) $display("FAIL: Test case 6 failed (e=0, s=1, y=0)"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule