`timescale 1ns/1ps

module tb_bit_2_vedic;

reg [1:0] in1;
reg [1:0] in2;
wire [3:0] out;

// Instantiate the unit under test (UUT)
bit_2_vedic uut (
    .in1(in1),
    .in2(in2),
    .out(out)
);

initial begin
    // Test case 1: 00 * 00 = 0000
    in1 = 2'b00; in2 = 2'b00; #10;
    if (out !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", out);

    // Test case 2: 01 * 01 = 0001
    in1 = 2'b01; in2 = 2'b01; #10;
    if (out !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", out);

    // Test case 3: 01 * 10 = 0001
    in1 = 2'b01; in2 = 2'b10; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", out);

    // Test case 4: 10 * 01 = 0001
    in1 = 2'b10; in2 = 2'b01; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 4 failed, expected 0010, got %b", out);

    // Test case 5: 10 * 10 = 0001
    in1 = 2'b10; in2 = 2'b10; #10;
    if (out !== 4'b0100) $display("FAIL: Test case 5 failed, expected 0100, got %b", out);

    // Test case 6: 11 * 11 = 0001
    in1 = 2'b11; in2 = 2'b11; #10;
    if (out !== 4'b1001) $display("FAIL: Test case 6 failed, expected 1001, got %b", out);

    // Test case 7: 11 * 10 = 0001
    in1 = 2'b11; in2 = 2'b10; #10;
    if (out !== 4'b0110) $display("FAIL: Test case 7 failed, expected 0110, got %b", out);

    // Test case 8: 10 * 11 = 0001
    in1 = 2'b10; in2 = 2'b11; #10;
    if (out !== 4'b0110) $display("FAIL: Test case 8 failed, expected 0110, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule