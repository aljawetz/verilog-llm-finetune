`timescale 1ns/1ps

module tb_CLA_4;
    reg [3:0] in1, in2;
    wire [3:0] sum;
    wire cout;

    CLA_4 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0
        in1 = 4'b0000; in2 = 4'b0000; #10;
        if (sum !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1
        in1 = 4'b0001; in2 = 4'b0001; #10;
        if (sum !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 2
        in1 = 4'b0011; in2 = 4'b0010; #10;
        if (sum !== 4'b0101 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 1
        in1 = 4'b0111; in2 = 4'b0001; #10;
        if (sum !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 8 + 8
        in1 = 4'b1000; in2 = 4'b1000; #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 15 + 1
        in1 = 4'b1111; in2 = 4'b0001; #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule