`timescale 1ns/1ps

module tb_decoder;

    reg A, B, C;
    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    // Instantiate the decoder module
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
        if (Y0 !== 1 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0 || Y4 !== 0 || Y5 !== 0 || Y6 !== 0 || Y7 !== 0) 
            $display("FAIL: Test case 000 failed");

        {A, B, C} = 3'b001; #10;
        if (Y0 !== 0 || Y1 !== 1 || Y2 !== 0 || Y3 !== 0 || Y4 !== 0 || Y5 !== 0 || Y6 !== 0 || Y7 !== 0) 
            $display("FAIL: Test case 001 failed");

        {A, B, C} = 3'b010; #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 1 || Y3 !== 0 || Y4 !== 0 || Y5 !== 0 || Y6 !== 0 || Y7 !== 0) 
            $display("FAIL: Test case 010 failed");

        {A, B, C} = 3'b011; #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 1 || Y4 !== 0 || Y5 !== 0 || Y6 !== 0 || Y7 !== 0) 
            $display("FAIL: Test case 011 failed");

        {A, B, C} = 3'b100; #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0 || Y4 !== 1 || Y5 !== 0 || Y6 !== 0 || Y7 !== 0) 
            $display("FAIL: Test case 100 failed");

        {A, B, C} = 3'b101; #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0 || Y4 !== 0 || Y5 !== 1 || Y6 !== 0 || Y7 !== 0) 
            $display("FAIL: Test case 101 failed");

        {A, B, C} = 3'b110; #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0 || Y4 !== 0 || Y5 !== 0 || Y6 !== 1 || Y7 !== 0) 
            $display("FAIL: Test case 110 failed");

        {A, B, C} = 3'b111; #10;
        if (Y0 !== 0 || Y1 !== 0 || Y2 !== 0 || Y3 !== 0 || Y4 !== 0 || Y5 !== 0 || Y6 !== 0 || Y7 !== 1) 
            $display("FAIL: Test case 111 failed");

        $display("PASS");
        $finish;
    end

endmodule