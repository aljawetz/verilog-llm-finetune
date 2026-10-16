`timescale 1ns/1ps

module tb_parity_checker;

reg [7:0] d;
reg p;
wire e;

// Instantiate the module under test
parity_checker uut (
    .d(d),
    .p(p),
    .e(e)
);

initial begin
    // Test case 1: No parity error (even parity)
    d = 8'b00000000; // Even parity (0 bits set)
    p = 0;           // Expected parity bit
    #10;
    if (e !== 0) $display("FAIL: Test case 1 failed, expected e = 0, got e = %b", e);

    // Test case 2: No parity error (even parity)
    d = 8'b11111111; // Even parity (8 bits set)
    p = 0;           // Expected parity bit
    #10;
    if (e !== 0) $display("FAIL: Test case 2 failed, expected e = 0, got e = %b", e);

    // Test case 3: Parity error (odd parity)
    d = 8'b00000001; // Odd parity (1 bit set)
    p = 1;           // Expected parity bit
    #10;
    if (e !== 0) $display("FAIL: Test case 3 failed, expected e = 0, got e = %b", e);

    // Test case 4: Parity error (odd parity)
    d = 8'b00000011; // Even parity (2 bits set)
    p = 1;           // Expected parity bit
    #10;
    if (e !== 1) $display("FAIL: Test case 4 failed, expected e = 1, got e = %b", e);

    // Test case 5: No parity error (even parity)
    d = 8'b00001111; // Even parity (4 bits set)
    p = 0;           // Expected parity bit
    #10;
    if (e !== 0) $display("FAIL: Test case 5 failed, expected e = 0, got e = %b", e);

    // Test case 6: Parity error (odd parity)
    d = 8'b00001110; // Odd parity (5 bits set)
    p = 1;           // Expected parity bit
    #10;
    if (e !== 0) $display("FAIL: Test case 6 failed, expected e = 0, got e = %b", e);

    // Test case 7: No parity error (even parity)
    d = 8'b11110000; // Even parity (4 bits set)
    p = 0;           // Expected parity bit
    #10;
    if (e !== 0) $display("FAIL: Test case 7 failed, expected e = 0, got e = %b", e);

    // Test case 8: Parity error (odd parity)
    d = 8'b11110001; // Odd parity (5 bits set)
    p = 1;           // Expected parity bit
    #10;
    if (e !== 0) $display("FAIL: Test case 8 failed, expected e = 0, got e = %b", e);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule