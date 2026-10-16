`timescale 1ns/1ps

module tb_four_bit_ripple_carry_adder;

reg [3:0] a;
reg [3:0] b;
wire [3:0] s;
wire cout;

// Instantiate the unit under test (UUT)
four_bit_ripple_carry_adder uut (
    .a(a),
    .b(b),
    .s(s),
    .cout(cout)
);

initial begin
    // Test case 1: 0 + 0 = 0
    a = 4'b0000; b = 4'b0000; #10;
    if (s !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: 1 + 1 = 10 (binary)
    a = 4'b0001; b = 4'b0001; #10;
    if (s !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

    // Test case 3: 3 + 5 = 8
    a = 4'b0011; b = 4'b0101; #10;
    if (s !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: 7 + 8 = 15
    a = 4'b0111; b = 4'b1000; #10;
    if (s !== 4'b1111 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: 15 + 1 = 0 with carry out
    a = 4'b1111; b = 4'b0001; #10;
    if (s !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: 10 + 5 = 15
    a = 4'b1010; b = 4'b0101; #10;
    if (s !== 4'b1111 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule