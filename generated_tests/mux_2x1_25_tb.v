`timescale 1ns/1ps

module tb_mux_2x1;

  reg i0;
  reg i1;
  reg s;
  wire y;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .i0(i0),
    .i1(i1),
    .s(s),
    .y(y)
  );

  initial begin
    // Test sequence
    // Test case 1: s = 0, expect y = i0
    i0 = 1'b0; i1 = 1'b0; s = 1'b0; #10;
    if (y !== 1'b0) $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);

    // Test case 2: s = 0, expect y = i0
    i0 = 1'b1; i1 = 1'b0; s = 1'b0; #10;
    if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);

    // Test case 3: s = 1, expect y = i1
    i0 = 1'b0; i1 = 1'b0; s = 1'b1; #10;
    if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);

    // Test case 4: s = 1, expect y = i1
    i0 = 1'b0; i1 = 1'b1; s = 1'b1; #10;
    if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);

    // Test case 5: s = 0, expect y = i0
    i0 = 1'b1; i1 = 1'b1; s = 1'b0; #10;
    if (y !== 1'b1) $display("FAIL: Test case 5 failed, expected y = 1, got y = %b", y);

    // Test case 6: s = 1, expect y = i1
    i0 = 1'b1; i1 = 1'b0; s = 1'b1; #10;
    if (y !== 1'b0) $display("FAIL: Test case 6 failed, expected y = 0, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule