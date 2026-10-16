`timescale 1ns/1ps

module tb_cla_4bit;

    reg [3:0] A;
    reg [3:0] B;
    reg cin;
    wire [3:0] S;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    cla_4bit uut (
        .A(A),
        .B(B),
        .cin(cin),
        .S(S),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        A = 4'b0000; B = 4'b0000; cin = 1'b0;
        #10;
        if (S !== 4'b0000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        A = 4'b0001; B = 4'b0001; cin = 1'b0;
        #10;
        if (S !== 4'b0010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 3 + 0
        A = 4'b0011; B = 4'b0011; cin = 1'b0;
        #10;
        if (S !== 4'b0110 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 8 + 0
        A = 4'b0111; B = 4'b1000; cin = 1'b0;
        #10;
        if (S !== 4'b1111 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 15 + 1 + 0 (should carry out)
        A = 4'b1111; B = 4'b0001; cin = 1'b0;
        #10;
        if (S !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 5 + 5 + 1
        A = 4'b0101; B = 4'b0101; cin = 1'b1;
        #10;
        if (S !== 4'b1011 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 9 + 6 + 1
        A = 4'b1001; B = 4'b0110; cin = 1'b1;
        #10;
        if (S !== 4'b0000 || cout !== 1'b1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule