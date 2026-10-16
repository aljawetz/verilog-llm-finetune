`timescale 1ns/1ps

module tb_bnry_graycode;

reg [3:0] in;
wire [3:0] out;

// Instantiate the module under test
bnry_graycode uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    // Test case 1: Binary 0000 -> Gray 0000
    in = 4'b0000; #10;
    if (out !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", out);

    // Test case 2: Binary 0001 -> Gray 0001
    in = 4'b0001; #10;
    if (out !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", out);

    // Test case 3: Binary 0010 -> Gray 0011
    in = 4'b0010; #10;
    if (out !== 4'b0011) $display("FAIL: Test case 3 failed, expected 0011, got %b", out);

    // Test case 4: Binary 0011 -> Gray 0010
    in = 4'b0011; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 4 failed, expected 0010, got %b", out);

    // Test case 5: Binary 0100 -> Gray 0011
    in = 4'b0100; #10;
    if (out !== 4'b0011) $display("FAIL: Test case 5 failed, expected 0011, got %b", out);

    // Test case 6: Binary 0101 -> Gray 0010
    in = 4'b0101; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 6 failed, expected 0010, got %b", out);

    // Test case 7: Binary 0110 -> Gray 0001
    in = 4'b0110; #10;
    if (out !== 4'b0001) $display("FAIL: Test case 7 failed, expected 0001, got %b", out);

    // Test case 8: Binary 0111 -> Gray 0000
    in = 4'b0111; #10;
    if (out !== 4'b0000) $display("FAIL: Test case 8 failed, expected 0000, got %b", out);

    // Test case 9: Binary 1000 -> Gray 1000
    in = 4'b1000; #10;
    if (out !== 4'b1000) $display("FAIL: Test case 9 failed, expected 1000, got %b", out);

    // Test case 10: Binary 1111 -> Gray 1000
    in = 4'b1111; #10;
    if (out !== 4'b1000) $display("FAIL: Test case 10 failed, expected 1000, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule