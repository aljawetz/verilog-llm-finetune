`timescale 1ns/1ps

module tb_comparator;

    reg [1:0] A;
    reg [1:0] B;
    wire L;
    wire E;
    wire G;

    // Instantiate the comparator module
    comparator uut (
        .A(A),
        .B(B),
        .L(L),
        .E(E),
        .G(G)
    );

    initial begin
        // Test case 1: A = 00, B = 00 (Equal)
        A = 2'b00; B = 2'b00;
        #10;
        if (L !== 0 || E !== 1 || G !== 0) $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 01, B = 00 (Greater)
        A = 2'b01; B = 2'b00;
        #10;
        if (L !== 0 || E !== 0 || G !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: A = 00, B = 01 (Less)
        A = 2'b00; B = 2'b01;
        #10;
        if (L !== 1 || E !== 0 || G !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: A = 10, B = 01 (Greater)
        A = 2'b10; B = 2'b01;
        #10;
        if (L !== 0 || E !== 0 || G !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: A = 01, B = 10 (Less)
        A = 2'b01; B = 2'b10;
        #10;
        if (L !== 1 || E !== 0 || G !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: A = 11, B = 11 (Equal)
        A = 2'b11; B = 2'b11;
        #10;
        if (L !== 0 || E !== 1 || G !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: A = 10, B = 11 (Less)
        A = 2'b10; B = 2'b11;
        #10;
        if (L !== 1 || E !== 0 || G !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: A = 11, B = 10 (Greater)
        A = 2'b11; B = 2'b10;
        #10;
        if (L !== 0 || E !== 0 || G !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule