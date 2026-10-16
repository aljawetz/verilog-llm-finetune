`timescale 1ns/1ps

module tb_cla;
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    // Outputs
    wire [3:0] sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    cla uut (
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

        // Test case 3: 3 + 3 + 0
        a = 4'b0011; b = 4'b0011; cin = 1'b0;
        #10;
        if (sum !== 4'b0110 || carry !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 1 + 0
        a = 4'b0111; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b1000 || carry !== 1'b1) $display("FAIL: Test case 4 failed");

        // Test case 5: 15 + 1 + 0
        a = 4'b1111; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 5 + 5 + 1
        a = 4'b0101; b = 4'b0101; cin = 1'b1;
        #10;
        if (sum !== 4'b1011 || carry !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 9 + 7 + 1
        a = 4'b1001; b = 4'b0111; cin = 1'b1;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule