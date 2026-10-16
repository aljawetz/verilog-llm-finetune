`timescale 1ns/1ps

module tb_Logical;

    reg [2:0] A;
    reg [2:0] B;
    reg [2:0] C;
    reg [2:0] D;
    reg [2:0] E;
    reg [2:0] F;
    wire Y;

    // Instantiate the module under test
    Logical uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .Y(Y)
    );

    initial begin
        // Test case 1: A = B, C > D, E >= F
        A = 3'b101; B = 3'b101; C = 3'b110; D = 3'b100; E = 3'b001; F = 3'b000;
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed, expected Y=1, got Y=%b", Y);

        // Test case 2: A = B, C <= D, E >= F
        A = 3'b111; B = 3'b111; C = 3'b010; D = 3'b100; E = 3'b001; F = 3'b000;
        #10;
        if (Y !== 0) $display("FAIL: Test case 2 failed, expected Y=0, got Y=%b", Y);

        // Test case 3: A != B
        A = 3'b001; B = 3'b010; C = 3'b111; D = 3'b000; E = 3'b011; F = 3'b010;
        #10;
        if (Y !== 0) $display("FAIL: Test case 3 failed, expected Y=0, got Y=%b", Y);

        // Test case 4: A = B, C > D, E < F
        A = 3'b100; B = 3'b100; C = 3'b101; D = 3'b011; E = 3'b001; F = 3'b010;
        #10;
        if (Y !== 1) $display("FAIL: Test case 4 failed, expected Y=1, got Y=%b", Y);

        // Test case 5: A = B, C <= D, E < F
        A = 3'b010; B = 3'b010; C = 3'b001; D = 3'b010; E = 3'b000; F = 3'b001;
        #10;
        if (Y !== 0) $display("FAIL: Test case 5 failed, expected Y=0, got Y=%b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule