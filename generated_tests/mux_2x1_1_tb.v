`timescale 1ns/1ps

module tb_mux_2x1;

  reg x0;
  reg x1;
  reg sel;
  wire y;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .x0(x0),
    .x1(x1),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Test case 1: sel = 0, expect y = x0
    x0 = 1'b0; x1 = 1'b1; sel = 1'b0;
    #10;
    if (y !== x0) $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", x0, y);

    // Test case 2: sel = 1, expect y = x1
    x0 = 1'b0; x1 = 1'b1; sel = 1'b1;
    #10;
    if (y !== x1) $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", x1, y);

    // Test case 3: sel = 0, expect y = x0
    x0 = 1'b1; x1 = 1'b0; sel = 1'b0;
    #10;
    if (y !== x0) $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", x0, y);

    // Test case 4: sel = 1, expect y = x1
    x0 = 1'b1; x1 = 1'b0; sel = 1'b1;
    #10;
    if (y !== x1) $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", x1, y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule