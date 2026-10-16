`timescale 1ns/1ps

module tb_half_adder;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire SUM;
    wire CARRY;

    // Instantiate the half_adder module
    half_adder uut (
        .A(A),
        .B(B),
        .SUM(SUM),
        .CARRY(CARRY)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (SUM !== 0 || CARRY !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (SUM !== 1 || CARRY !== 0) begin
            $display("FAIL: Test case 2 failed (A=0, B=1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (SUM !== 1 || CARRY !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B=0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (SUM !== 0 || CARRY !== 1) begin
            $display("FAIL: Test case 4 failed (A=1, B=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule