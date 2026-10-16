`timescale 1ns/1ps

module tb_halfsubtractorD;

    reg A, B;
    wire diff, borrow;

    // Instantiate the halfsubtractorD module
    halfsubtractorD uut (
        .diff(diff),
        .borrow(borrow),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (diff !== 0 || borrow !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (diff !== 1 || borrow !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (diff !== 1 || borrow !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (diff !== 0 || borrow !== 0) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule