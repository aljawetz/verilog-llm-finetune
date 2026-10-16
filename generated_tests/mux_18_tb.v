`timescale 1ns/1ps

module tb_mux;

  // Inputs
  reg s;
  reg i0;
  reg i1;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  mux uut (
    .s(s),
    .i0(i0),
    .i1(i1),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, i0 = 1, i1 = 0
    s = 0; i0 = 1; i1 = 0;
    #10;
    if (y !== 1) $display("FAIL: Test case 1 failed, expected y = 1, got y = %b", y);

    // Test case 2: s = 1, i0 = 1, i1 = 0
    s = 1; i0 = 1; i1 = 0;
    #10;
    if (y !== 0) $display("FAIL: Test case 2 failed, expected y = 0, got y = %b", y);

    // Test case 3: s = 0, i0 = 0, i1 = 1
    s = 0; i0 = 0; i1 = 1;
    #10;
    if (y !== 0) $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);

    // Test case 4: s = 1, i0 = 0, i1 = 1
    s = 1; i0 = 0; i1 = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);

    // Test case 5: s = 0, i0 = 1, i1 = 1
    s = 0; i0 = 1; i1 = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 5 failed, expected y = 1, got y = %b", y);

    // Test case 6: s = 1, i0 = 1, i1 = 1
    s = 1; i0 = 1; i1 = 1;
    #10;
    if (y !== 1) $display("FAIL: Test case 6 failed, expected y = 1, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule