`timescale 1ns/1ps

module tb_CLA_3_c;

    reg [2:0] in1;
    reg [2:0] in2;
    reg cin;
    wire [2:0] sum;
    wire cout;

    // Instantiate the module under test (uut)
    CLA_3_c uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        in1 = 3'b000; in2 = 3'b000; cin = 1'b0;
        #10;
        if (sum !== 3'b000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        in1 = 3'b001; in2 = 3'b001; cin = 1'b0;
        #10;
        if (sum !== 3'b010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 1 + 1 + 1
        in1 = 3'b001; in2 = 3'b001; cin = 1'b1;
        #10;
        if (sum !== 3'b011 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 3 + 3 + 0
        in1 = 3'b011; in2 = 3'b011; cin = 1'b0;
        #10;
        if (sum !== 3'b110 || cout !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: 5 + 2 + 0
        in1 = 3'b101; in2 = 3'b010; cin = 1'b0;
        #10;
        if (sum !== 3'b111 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 7 + 1 + 0
        in1 = 3'b111; in2 = 3'b001; cin = 1'b0;
        #10;
        if (sum !== 3'b000 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: 4 + 4 + 1
        in1 = 3'b100; in2 = 3'b100; cin = 1'b1;
        #10;
        if (sum !== 3'b001 || cout !== 1'b1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule