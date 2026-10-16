`timescale 1ns/1ps

module tb_Subtractor_HALF;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire Sub;
    wire Borrow;

    // Instantiate the Unit Under Test (UUT)
    Subtractor_HALF uut (
        .A(A),
        .B(B),
        .Sub(Sub),
        .Borrow(Borrow)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (Sub !== 0 || Borrow !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (Sub !== 1 || Borrow !== 1) begin
            $display("FAIL: Test case 2 failed (A=0, B=1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (Sub !== 1 || Borrow !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B=0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (Sub !== 0 || Borrow !== 0) begin
            $display("FAIL: Test case 4 failed (A=1, B=1)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule