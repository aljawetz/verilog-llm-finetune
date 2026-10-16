`timescale 1ns/1ps

module tb_CLA4;

    reg [3:0] in1;
    reg [3:0] in2;
    reg cin;
    wire [3:0] sum;
    wire cout;

    CLA4 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        in1 = 4'b0000; in2 = 4'b0000; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0 = 2
        in1 = 4'b0001; in2 = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 3 + 0 = 6
        in1 = 4'b0011; in2 = 4'b0011; cin = 1'b0;
        #10;
        if (sum !== 4'b0110 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 1 + 0 = 8
        in1 = 4'b0111; in2 = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 8 + 1 + 0 = 9 (cout should be 0)
        in1 = 4'b1000; in2 = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b1001 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 7 + 1 + 1 = 9 (cout should be 0)
        in1 = 4'b0111; in2 = 4'b0001; cin = 1'b1;
        #10;
        if (sum !== 4'b1000 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 7 + 7 + 0 = 14 (cout should be 0)
        in1 = 4'b0111; in2 = 4'b0111; cin = 1'b0;
        #10;
        if (sum !== 4'b1110 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 15 + 1 + 0 = 0 (cout should be 1)
        in1 = 4'b1111; in2 = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 8 failed");

        // Test case 9: 15 + 0 + 1 = 0 (cout should be 1)
        in1 = 4'b1111; in2 = 4'b0000; cin = 1'b1;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 9 failed");

        // Test case 10: 0 + 0 + 1 = 1
        in1 = 4'b0000; in2 = 4'b0000; cin = 1'b1;
        #10;
        if (sum !== 4'b0001 || cout !== 1'b0) $display("FAIL: Test case 10 failed");

        $display("PASS");
        $finish;
    end

endmodule