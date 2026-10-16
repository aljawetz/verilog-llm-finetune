`timescale 1ns/1ps

module tb_b2g_des;

  reg [3:0] in;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  b2g_des uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test cases for all 4-bit binary inputs
    // Expected Gray code outputs are calculated manually
    // 0000 -> 0000
    in = 4'b0000; #10;
    if (out !== 4'b0000) $display("FAIL: Test case 0000 failed, got %b", out);

    // 0001 -> 0001
    in = 4'b0001; #10;
    if (out !== 4'b0001) $display("FAIL: Test case 0001 failed, got %b", out);

    // 0010 -> 0011
    in = 4'b0010; #10;
    if (out !== 4'b0011) $display("FAIL: Test case 0010 failed, got %b", out);

    // 0011 -> 0010
    in = 4'b0011; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 0011 failed, got %b", out);

    // 0100 -> 0110
    in = 4'b0100; #10;
    if (out !== 4'b0110) $display("FAIL: Test case 0100 failed, got %b", out);

    // 0101 -> 0111
    in = 4'b0101; #10;
    if (out !== 4'b0111) $display("FAIL: Test case 0101 failed, got %b", out);

    // 0110 -> 0101
    in = 4'b0110; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 0110 failed, got %b", out);

    // 0111 -> 0100
    in = 4'b0111; #10;
    if (out !== 4'b0100) $display("FAIL: Test case 0111 failed, got %b", out);

    // 1000 -> 1100
    in = 4'b1000; #10;
    if (out !== 4'b1100) $display("FAIL: Test case 1000 failed, got %b", out);

    // 1001 -> 1101
    in = 4'b1001; #10;
    if (out !== 4'b1101) $display("FAIL: Test case 1001 failed, got %b", out);

    // 1010 -> 1111
    in = 4'b1010; #10;
    if (out !== 4'b1111) $display("FAIL: Test case 1010 failed, got %b", out);

    // 1011 -> 1110
    in = 4'b1011; #10;
    if (out !== 4'b1110) $display("FAIL: Test case 1011 failed, got %b", out);

    // 1100 -> 1010
    in = 4'b1100; #10;
    if (out !== 4'b1010) $display("FAIL: Test case 1100 failed, got %b", out);

    // 1101 -> 1011
    in = 4'b1101; #10;
    if (out !== 4'b1011) $display("FAIL: Test case 1101 failed, got %b", out);

    // 1110 -> 1001
    in = 4'b1110; #10;
    if (out !== 4'b1001) $display("FAIL: Test case 1110 failed, got %b", out);

    // 1111 -> 1000
    in = 4'b1111; #10;
    if (out !== 4'b1000) $display("FAIL: Test case 1111 failed, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule