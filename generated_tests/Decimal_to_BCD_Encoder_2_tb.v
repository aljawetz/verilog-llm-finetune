`timescale 1ns/1ps

module tb_Decimal_to_BCD_Encoder;

    reg D0, D1, D2, D3, D4, D5, D6, D7, D8, D9;
    wire A, B, C, D;

    // Instantiate the module under test
    Decimal_to_BCD_Encoder uut (
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3),
        .D4(D4),
        .D5(D5),
        .D6(D6),
        .D7(D7),
        .D8(D8),
        .D9(D9),
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );

    initial begin
        // Test all one-hot inputs from D0 to D9
        // Expected outputs are based on the one-hot input
        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000000; // All inputs low
        #10;
        if ({A, B, C, D} !== 4'b0000) $display("FAIL: Expected 0000 for all inputs low");

        D0 = 1; #10;
        if ({A, B, C, D} !== 4'b0000) $display("FAIL: Expected 0000 for D0");

        D0 = 0; D1 = 1; #10;
        if ({A, B, C, D} !== 4'b0001) $display("FAIL: Expected 0001 for D1");

        D1 = 0; D2 = 1; #10;
        if ({A, B, C, D} !== 4'b0010) $display("FAIL: Expected 0010 for D2");

        D2 = 0; D3 = 1; #10;
        if ({A, B, C, D} !== 4'b0011) $display("FAIL: Expected 0011 for D3");

        D3 = 0; D4 = 1; #10;
        if ({A, B, C, D} !== 4'b0100) $display("FAIL: Expected 0100 for D4");

        D4 = 0; D5 = 1; #10;
        if ({A, B, C, D} !== 4'b0101) $display("FAIL: Expected 0101 for D5");

        D5 = 0; D6 = 1; #10;
        if ({A, B, C, D} !== 4'b0110) $display("FAIL: Expected 0110 for D6");

        D6 = 0; D7 = 1; #10;
        if ({A, B, C, D} !== 4'b0111) $display("FAIL: Expected 0111 for D7");

        D7 = 0; D8 = 1; #10;
        if ({A, B, C, D} !== 4'b1000) $display("FAIL: Expected 1000 for D8");

        D8 = 0; D9 = 1; #10;
        if ({A, B, C, D} !== 4'b1001) $display("FAIL: Expected 1001 for D9");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule