`timescale 1ns/1ps

module tb_half_subtractor;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire DIFF;
    wire BORROW;

    // Instantiate the half_subtractor module
    half_subtractor uut (
        .A(A),
        .B(B),
        .DIFF(DIFF),
        .BORROW(BORROW)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (DIFF !== 0 || BORROW !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (DIFF !== 1 || BORROW !== 1) begin
            $display("FAIL: Test case 2 failed (A=0, B=1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (DIFF !== 1 || BORROW !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B=0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (DIFF !== 0 || BORROW !== 0) begin
            $display("FAIL: Test case 4 failed (A=1, B=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule