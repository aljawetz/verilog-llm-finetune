`timescale 1ns/1ps

module tb_magnitude_3bit_comparator;

    reg [2:0] A;
    reg [2:0] B;
    wire L;
    wire E;
    wire G;

    // Instantiate the module under test (uut)
    magnitude_3bit_comparator uut (
        .A(A),
        .B(B),
        .L(L),
        .E(E),
        .G(G)
    );

    initial begin
        // Test case 1: A = 000, B = 000 (Equal)
        A = 3'b000; B = 3'b000;
        #10;
        if (L !== 0 || E !== 1 || G !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: A = 001, B = 000 (Greater)
        A = 3'b001; B = 3'b000;
        #10;
        if (L !== 0 || E !== 0 || G !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: A = 000, B = 001 (Less)
        A = 3'b000; B = 3'b001;
        #10;
        if (L !== 1 || E !== 0 || G !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: A = 010, B = 001 (Greater)
        A = 3'b010; B = 3'b001;
        #10;
        if (L !== 0 || E !== 0 || G !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: A = 001, B = 010 (Less)
        A = 3'b001; B = 3'b010;
        #10;
        if (L !== 1 || E !== 0 || G !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: A = 111, B = 111 (Equal)
        A = 3'b111; B = 3'b111;
        #10;
        if (L !== 0 || E !== 1 || G !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: A = 110, B = 111 (Less)
        A = 3'b110; B = 3'b111;
        #10;
        if (L !== 1 || E !== 0 || G !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: A = 111, B = 110 (Greater)
        A = 3'b111; B = 3'b110;
        #10;
        if (L !== 0 || E !== 0 || G !== 1) $display("FAIL: Test case 8 failed");

        // Test case 9: A = 101, B = 100 (Greater)
        A = 3'b101; B = 3'b100;
        #10;
        if (L !== 0 || E !== 0 || G !== 1) $display("FAIL: Test case 9 failed");

        // Test case 10: A = 100, B = 101 (Less)
        A = 3'b100; B = 3'b101;
        #10;
        if (L !== 1 || E !== 0 || G !== 0) $display("FAIL: Test case 10 failed");

        $display("PASS");
        $finish;
    end

endmodule