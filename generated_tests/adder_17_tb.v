`timescale 1ns/1ps

module tb_adder;

    reg A;
    reg B;
    reg Cin;
    wire Y;
    wire Cout;

    // Instantiate the adder module
    adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Y(Y),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, Cout = 0
        A = 0; B = 0; Cin = 0;
        #10;
        if (Y !== 0 || Cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1 = 1, Cout = 0
        A = 0; B = 0; Cin = 1;
        #10;
        if (Y !== 1 || Cout !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 0 = 1, Cout = 0
        A = 0; B = 1; Cin = 0;
        #10;
        if (Y !== 1 || Cout !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: 1 + 0 + 0 = 1, Cout = 0
        A = 1; B = 0; Cin = 0;
        #10;
        if (Y !== 1 || Cout !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 1 + 0 = 0, Cout = 1
        A = 1; B = 1; Cin = 0;
        #10;
        if (Y !== 0 || Cout !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 1 + 1 = 1, Cout = 1
        A = 1; B = 1; Cin = 1;
        #10;
        if (Y !== 1 || Cout !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: 0 + 1 + 1 = 0, Cout = 1
        A = 0; B = 1; Cin = 1;
        #10;
        if (Y !== 0 || Cout !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: 1 + 0 + 1 = 0, Cout = 1
        A = 1; B = 0; Cin = 1;
        #10;
        if (Y !== 0 || Cout !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule