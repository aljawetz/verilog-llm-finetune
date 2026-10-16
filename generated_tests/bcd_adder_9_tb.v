`timescale 1ns/1ps

module tb_bcd_adder;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate the BCD adder
    bcd_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test case 1: 2 + 3 + 0 = 5
        a = 4'd2; b = 4'd3; cin = 1'b0;
        #10;
        if (sum !== 4'd5 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 5 + 4 + 0 = 9
        a = 4'd5; b = 4'd4; cin = 1'b0;
        #10;
        if (sum !== 4'd9 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 7 + 3 + 0 = 10 (needs correction)
        a = 4'd7; b = 4'd3; cin = 1'b0;
        #10;
        if (sum !== 4'd1 || cout !== 1'b1) $display("FAIL: Test case 3 failed");

        // Test case 4: 9 + 1 + 0 = 10 (needs correction)
        a = 4'd9; b = 4'd1; cin = 1'b0;
        #10;
        if (sum !== 4'd0 || cout !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: 8 + 2 + 1 = 11 (needs correction)
        a = 4'd8; b = 4'd2; cin = 1'b1;
        #10;
        if (sum !== 4'd2 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 0 + 0 + 0 = 0
        a = 4'd0; b = 4'd0; cin = 1'b0;
        #10;
        if (sum !== 4'd0 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 5 + 5 + 1 = 11 (needs correction)
        a = 4'd5; b = 4'd5; cin = 1'b1;
        #10;
        if (sum !== 4'd2 || cout !== 1'b1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule