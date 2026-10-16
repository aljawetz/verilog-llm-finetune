`timescale 1ns/1ps

module tb_Comparator_1bit;

    reg A;
    reg B;
    wire Equal;
    wire GT;
    wire LT;

    // Instantiate the module under test (uut)
    Comparator_1bit uut (
        .A(A),
        .B(B),
        .Equal(Equal),
        .GT(GT),
        .LT(LT)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (Equal !== 1 || GT !== 0 || LT !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (Equal !== 0 || GT !== 0 || LT !== 1) begin
            $display("FAIL: Test case 2 failed (A=0, B=1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (Equal !== 0 || GT !== 1 || LT !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B=0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (Equal !== 1 || GT !== 0 || LT !== 0) begin
            $display("FAIL: Test case 4 failed (A=1, B=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule