`timescale 1ns/1ps

module tb_Decimal_to_BCD_Encoder;

    reg D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
    wire A, B, C, D;

    // Instantiate the module under test (uut)
    Decimal_to_BCD_Encoder uut (
        .D0(D0), .D1(D1), .D2(D2), .D3(D3), .D4(D4), 
        .D5(D5), .D6(D6), .D7(D7), .D8(D8), .D9(D9), 
        .A(A), .B(B), .C(C), .D(D)
    );

    initial begin
        // Test case 1: Input 0 (0000000000)
        D0 = 1; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 0 || C !== 0 || D !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: Input 1 (0000000001)
        D0 = 0; D1 = 1; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 0 || C !== 0 || D !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: Input 2 (0000000010)
        D0 = 0; D1 = 0; D2 = 1; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 0 || C !== 1 || D !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: Input 3 (0000000011)
        D0 = 0; D1 = 0; D2 = 0; D3 = 1; D4 = 0; D5 = 0; D6 = 0; D7 = 0; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 0 || C !== 1 || D !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: Input 4 (0000000100)
        D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 1; D5 = 0; D6 = 0; D7 = 0; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 1 || C !== 0 || D !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: Input 5 (0000000101)
        D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 1; D6 = 0; D7 = 0; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 1 || C !== 0 || D !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: Input 6 (0000000110)
        D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 1; D7 = 0; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 1 || C !== 1 || D !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: Input 7 (0000000111)
        D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 1; D8 = 0; D9 = 0;
        #10;
        if (A !== 0 || B !== 1 || C !== 1 || D !== 1) $display("FAIL: Test case 8 failed");

        // Test case 9: Input 8 (0000001000)
        D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0; D8 = 1; D9 = 0;
        #10;
        if (A !== 1 || B !== 0 || C !== 0 || D !== 0) $display("FAIL: Test case 9 failed");

        // Test case 10: Input 9 (0000001001)
        D0 = 0; D1 = 0; D2 = 0; D3 = 0; D4 = 0; D5 = 0; D6 = 0; D7 = 0; D8 = 0; D9 = 1;
        #10;
        if (A !== 1 || B !== 0 || C !== 0 || D !== 1) $display("FAIL: Test case 10 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule