`timescale 1ns/1ps

module tb_demux_1x2;

  reg a;
  reg s;
  wire [1:0] y;

  // Instantiate the module under test (uut)
  demux_1x2 uut (
    .a(a),
    .s(s),
    .y(y)
  );

  initial begin
    // Test sequence
    // Test case 1: s = 0, a = 0
    a = 0; s = 0;
    #10;
    if (y !== 2'b10) $display("FAIL: Test case 1 failed, expected y = 10, got y = %b", y);

    // Test case 2: s = 0, a = 1
    a = 1; s = 0;
    #10;
    if (y !== 2'b01) $display("FAIL: Test case 2 failed, expected y = 01, got y = %b", y);

    // Test case 3: s = 1, a = 0
    a = 0; s = 1;
    #10;
    if (y !== 2'b00) $display("FAIL: Test case 3 failed, expected y = 00, got y = %b", y);

    // Test case 4: s = 1, a = 1
    a = 1; s = 1;
    #10;
    if (y !== 2'b01) $display("FAIL: Test case 4 failed, expected y = 01, got y = %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule