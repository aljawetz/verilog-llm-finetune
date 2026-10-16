`timescale 1ns/1ps

module tb_CLA_2;
    reg [1:0] in1;
    reg [1:0] in2;
    wire [1:0] sum;
    wire cout;

    // Instantiate the unit under test (UUT)
    CLA_2 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 00 + 00 = 00
        in1 = 2'b00; in2 = 2'b00; #10;
        if (sum !== 2'b00 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 01 + 01 = 10
        in1 = 2'b01; in2 = 2'b01; #10;
        if (sum !== 2'b10 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 01 + 10 = 11
        in1 = 2'b01; in2 = 2'b10; #10;
        if (sum !== 2'b11 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 10 + 01 = 11
        in1 = 2'b10; in2 = 2'b01; #10;
        if (sum !== 2'b11 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 10 + 10 = 00 with carry
        in1 = 2'b10; in2 = 2'b10; #10;
        if (sum !== 2'b00 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 11 + 11 = 11 with carry
        in1 = 2'b11; in2 = 2'b11; #10;
        if (sum !== 2'b10 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: 11 + 00 = 11
        in1 = 2'b11; in2 = 2'b00; #10;
        if (sum !== 2'b11 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 00 + 11 = 11
        in1 = 2'b00; in2 = 2'b11; #10;
        if (sum !== 2'b11 || cout !== 1'b0) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule