`timescale 1ns/1ps

module tb_decoder;

    reg A, B, C;
    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    // Instantiate the module under test
    decoder uut (
        .A(A),
        .B(B),
        .C(C),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .Y5(Y5),
        .Y6(Y6),
        .Y7(Y7)
    );

    initial begin
        // Test all combinations of A, B, C
        {A, B, C} = 3'b000; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b00000001) $display("FAIL: Test case 000 failed");

        {A, B, C} = 3'b001; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b00000010) $display("FAIL: Test case 001 failed");

        {A, B, C} = 3'b010; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b00000100) $display("FAIL: Test case 010 failed");

        {A, B, C} = 3'b011; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b00001000) $display("FAIL: Test case 011 failed");

        {A, B, C} = 3'b100; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b00010000) $display("FAIL: Test case 100 failed");

        {A, B, C} = 3'b101; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b00100000) $display("FAIL: Test case 101 failed");

        {A, B, C} = 3'b110; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b01000000) $display("FAIL: Test case 110 failed");

        {A, B, C} = 3'b111; #10;
        if ({Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} !== 8'b10000000) $display("FAIL: Test case 111 failed");

        $display("PASS");
        $finish;
    end

endmodule