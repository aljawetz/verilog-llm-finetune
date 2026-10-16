`timescale 1ns/1ps

module tb_CLA_2;

    reg [1:0] in1;
    reg [1:0] in2;
    reg cin;
    wire [1:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    CLA_2_c uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 00 + 00 + 0 = 00
        in1 = 2'b00; in2 = 2'b00; cin = 1'b0;
        #10;
        if (sum !== 2'b00 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 01 + 01 + 0 = 10
        in1 = 2'b01; in2 = 2'b01; cin = 1'b0;
        #10;
        if (sum !== 2'b10 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 01 + 01 + 1 = 11
        in1 = 2'b01; in2 = 2'b01; cin = 1'b1;
        #10;
        if (sum !== 2'b11 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 10 + 01 + 0 = 11
        in1 = 2'b10; in2 = 2'b01; cin = 1'b0;
        #10;
        if (sum !== 2'b11 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 11 + 11 + 0 = 10
        in1 = 2'b11; in2 = 2'b11; cin = 1'b0;
        #10;
        if (sum !== 2'b10 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 11 + 11 + 1 = 00
        in1 = 2'b11; in2 = 2'b11; cin = 1'b1;
        #10;
        if (sum !== 2'b00 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule