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
        // Test all one-hot inputs
        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000001; #10;
        if ({A, B, C, D} !== 4'b0000) $display("FAIL: Input D0 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000010; #10;
        if ({A, B, C, D} !== 4'b0001) $display("FAIL: Input D1 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000000100; #10;
        if ({A, B, C, D} !== 4'b0010) $display("FAIL: Input D2 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000001000; #10;
        if ({A, B, C, D} !== 4'b0011) $display("FAIL: Input D3 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000010000; #10;
        if ({A, B, C, D} !== 4'b0100) $display("FAIL: Input D4 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0000100000; #10;
        if ({A, B, C, D} !== 4'b0101) $display("FAIL: Input D5 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0001000000; #10;
        if ({A, B, C, D} !== 4'b0110) $display("FAIL: Input D6 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0010000000; #10;
        if ({A, B, C, D} !== 4'b0111) $display("FAIL: Input D7 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b0100000000; #10;
        if ({A, B, C, D} !== 4'b1000) $display("FAIL: Input D8 failed");

        {D0, D1, D2, D3, D4, D5, D6, D7, D8, D9} = 10'b1000000000; #10;
        if ({A, B, C, D} !== 4'b1001) $display("FAIL: Input D9 failed");

        $display("PASS");
        $finish;
    end

endmodule