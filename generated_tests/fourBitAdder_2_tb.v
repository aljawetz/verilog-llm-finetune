`timescale 1ns/1ps

module tb_fourBitAdder;

reg [3:0] in1;
reg [3:0] in2;
wire [3:0] sum;

// Instantiate the module under test (uut)
fourBitAdder uut (
    .in1(in1),
    .in2(in2),
    .sum(sum)
);

initial begin
    // Test case 1: 0 + 0 = 0
    in1 = 4'b0000; in2 = 4'b0000;
    #10;
    if (sum !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0, got %b", sum);

    // Test case 2: 1 + 1 = 2
    in1 = 4'b0001; in2 = 4'b0001;
    #10;
    if (sum !== 4'b0010) $display("FAIL: Test case 2 failed, expected 2, got %b", sum);

    // Test case 3: 3 + 2 = 5
    in1 = 4'b0011; in2 = 4'b0010;
    #10;
    if (sum !== 4'b0101) $display("FAIL: Test case 3 failed, expected 5, got %b", sum);

    // Test case 4: 7 + 8 = 15
    in1 = 4'b0111; in2 = 4'b1000;
    #10;
    if (sum !== 4'b1111) $display("FAIL: Test case 4 failed, expected 15, got %b", sum);

    // Test case 5: 15 + 1 = 0 (overflow)
    in1 = 4'b1111; in2 = 4'b0001;
    #10;
    if (sum !== 4'b0000) $display("FAIL: Test case 5 failed, expected 0, got %b", sum);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule