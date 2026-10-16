`timescale 1ns/1ps

module tb_carry_look_ahead_gen;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire carry;

    carry_look_ahead_gen uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        a = 4'b0001; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0010 || carry !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 1 + 1 + 1
        a = 4'b0001; b = 4'b0001; cin = 1'b1;
        #10;
        if (sum !== 4'b0011 || carry !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 3 + 3 + 0
        a = 4'b0011; b = 4'b0011; cin = 1'b0;
        #10;
        if (sum !== 4'b0110 || carry !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 7 + 8 + 0
        a = 4'b0111; b = 4'b1000; cin = 1'b0;
        #10;
        if (sum !== 4'b1111 || carry !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 15 + 1 + 0
        a = 4'b1111; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: 5 + 5 + 1
        a = 4'b0101; b = 4'b0101; cin = 1'b1;
        #10;
        if (sum !== 4'b1011 || carry !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 9 + 6 + 0
        a = 4'b1001; b = 4'b0110; cin = 1'b0;
        #10;
        if (sum !== 4'b1111 || carry !== 1'b0) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule