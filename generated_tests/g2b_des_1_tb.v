`timescale 1ns/1ps

module tb_g2b_des;

  reg [3:0] g_in;
  wire [3:0] b_out;

  // Instantiate the module under test
  g2b_des uut (
    .g_in(g_in),
    .b_out(b_out)
  );

  initial begin
    // Test cases
    // Test case 1: Gray code 0000 -> Binary 0000
    g_in = 4'b0000; #10;
    if (b_out !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", b_out);

    // Test case 2: Gray code 0001 -> Binary 0001
    g_in = 4'b0001; #10;
    if (b_out !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", b_out);

    // Test case 3: Gray code 0011 -> Binary 0010
    g_in = 4'b0011; #10;
    if (b_out !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", b_out);

    // Test case 4: Gray code 0111 -> Binary 0011
    g_in = 4'b0111; #10;
    if (b_out !== 4'b0011) $display("FAIL: Test case 4 failed, expected 0011, got %b", b_out);

    // Test case 5: Gray code 0100 -> Binary 0100
    g_in = 4'b0100; #10;
    if (b_out !== 4'b0100) $display("FAIL: Test case 5 failed, expected 0100, got %b", b_out);

    // Test case 6: Gray code 1111 -> Binary 1000
    g_in = 4'b1111; #10;
    if (b_out !== 4'b1000) $display("FAIL: Test case 6 failed, expected 1000, got %b", b_out);

    // Test case 7: Gray code 1000 -> Binary 1100
    g_in = 4'b1000; #10;
    if (b_out !== 4'b1100) $display("FAIL: Test case 7 failed, expected 1100, got %b", b_out);

    // Test case 8: Gray code 1010 -> Binary 1110
    g_in = 4'b1010; #10;
    if (b_out !== 4'b1110) $display("FAIL: Test case 8 failed, expected 1110, got %b", b_out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule