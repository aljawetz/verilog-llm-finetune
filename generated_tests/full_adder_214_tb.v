`timescale 1ns/1ps

module tb_full_adder;
    reg in1;
    reg in2;
    reg cin;
    wire sum;
    wire cout;

    // Instantiate the full adder
    full_adder uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        in1 = 0; in2 = 0; cin = 0;
        #10;
        if (sum !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1
        in1 = 0; in2 = 0; cin = 1;
        #10;
        if (sum !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 0
        in1 = 0; in2 = 1; cin = 0;
        #10;
        if (sum !== 1 || cout !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: 0 + 1 + 1
        in1 = 0; in2 = 1; cin = 1;
        #10;
        if (sum !== 0 || cout !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 0 + 0
        in1 = 1; in2 = 0; cin = 0;
        #10;
        if (sum !== 1 || cout !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 0 + 1
        in1 = 1; in2 = 0; cin = 1;
        #10;
        if (sum !== 0 || cout !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: 1 + 1 + 0
        in1 = 1; in2 = 1; cin = 0;
        #10;
        if (sum !== 0 || cout !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: 1 + 1 + 1
        in1 = 1; in2 = 1; cin = 1;
        #10;
        if (sum !== 1 || cout !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule