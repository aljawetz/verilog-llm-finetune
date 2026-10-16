`timescale 1ns/1ps

module tb_lcpmult;

  reg [4:0] in1, in2;
  wire [4:0] out;

  lcpmult uut (
    .in1(in1),
    .in2(in2),
    .out(out)
  );

  initial begin
    // Test case 1: 0 * 0 = 0
    in1 = 5'b00000; in2 = 5'b00000; #10;
    if (out !== 5'b00000) $display("FAIL: Test case 1 failed, expected 00000, got %b", out);

    // Test case 2: 1 * 1 = 1
    in1 = 5'b00001; in2 = 5'b00001; #10;
    if (out !== 5'b00001) $display("FAIL: Test case 2 failed, expected 00001, got %b", out);

    // Test case 3: 1 * 2 = 2
    in1 = 5'b00001; in2 = 5'b00010; #10;
    if (out !== 5'b00010) $display("FAIL: Test case 3 failed, expected 00010, got %b", out);

    // Test case 4: 3 * 3 = 1 (in GF(2))
    in1 = 5'b00011; in2 = 5'b00011; #10;
    if (out !== 5'b00001) $display("FAIL: Test case 4 failed, expected 00001, got %b", out);

    // Test case 5: 2 * 3 = 0 (in GF(2))
    in1 = 5'b00010; in2 = 5'b00011; #10;
    if (out !== 5'b00000) $display("FAIL: Test case 5 failed, expected 00000, got %b", out);

    // Test case 6: 4 * 4 = 0 (in GF(2))
    in1 = 5'b00100; in2 = 5'b00100; #10;
    if (out !== 5'b00000) $display("FAIL: Test case 6 failed, expected 00000, got %b", out);

    // Test case 7: 1 * 4 = 4
    in1 = 5'b00001; in2 = 5'b00100; #10;
    if (out !== 5'b00100) $display("FAIL: Test case 7 failed, expected 00100, got %b", out);

    // Test case 8: 4 * 3 = 1 (in GF(2))
    in1 = 5'b00100; in2 = 5'b00011; #10;
    if (out !== 5'b00001) $display("FAIL: Test case 8 failed, expected 00001, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule