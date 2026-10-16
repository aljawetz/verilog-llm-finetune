`timescale 1ns/1ps

module tb_CLA4_c;
    reg [3:0] in1;
    reg [3:0] in2;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    CLA4_c uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        in1 = 4'b0000; in2 = 4'b0000; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        in1 = 4'b0001; in2 = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 3 + 0
        in1 = 4'b0011; in2 = 4'b0011; cin = 1'b0;
        #10;
        if (sum !== 4'b0110 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 8 + 0
        in1 = 4'b0111; in2 = 4'b1000; cin = 1'b0;
        #10;
        if (sum !== 4'b1111 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 15 + 1 + 0
        in1 = 4'b1111; in2 = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 1 + 1
        in1 = 4'b0001; in2 = 4'b0001; cin = 1'b1;
        #10;
        if (sum !== 4'b0011 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 2 + 2 + 1
        in1 = 4'b0010; in2 = 4'b0010; cin = 1'b1;
        #10;
        if (sum !== 4'b0101 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 5 + 5 + 1
        in1 = 4'b0101; in2 = 4'b0101; cin = 1'b1;
        #10;
        if (sum !== 4'b1011 || cout !== 1'b0) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule