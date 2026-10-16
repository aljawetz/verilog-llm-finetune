`timescale 1ns/1ps

module tb_CLA_3_c;

    reg [2:0] in1;
    reg [2:0] in2;
    reg cin;
    wire [2:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    CLA_3_c uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, cout = 0
        in1 = 3'b000; in2 = 3'b000; cin = 1'b0;
        #10;
        if (sum !== 3'b000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0 = 2, cout = 0
        in1 = 3'b001; in2 = 3'b001; cin = 1'b0;
        #10;
        if (sum !== 3'b010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 1 + 1 + 1 = 3, cout = 1
        in1 = 3'b001; in2 = 3'b001; cin = 1'b1;
        #10;
        if (sum !== 3'b011 || cout !== 1'b1) $display("FAIL: Test case 3 failed");

        // Test case 4: 3 + 3 + 0 = 6, cout = 0
        in1 = 3'b011; in2 = 3'b011; cin = 1'b0;
        #10;
        if (sum !== 3'b110 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 3 + 3 + 1 = 7, cout = 1
        in1 = 3'b011; in2 = 3'b011; cin = 1'b1;
        #10;
        if (sum !== 3'b111 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 2 + 1 + 1 = 4, cout = 0
        in1 = 3'b010; in2 = 3'b001; cin = 1'b1;
        #10;
        if (sum !== 3'b100 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule