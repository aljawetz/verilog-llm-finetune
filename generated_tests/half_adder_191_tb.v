`timescale 1ns/1ps

module tb_half_adder;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire sum;
    wire carry;

    // Instantiate the half_adder module
    half_adder uut (
        .A(A),
        .B(B),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (sum !== 0 || carry !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case 2 failed (A=0, B=1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B=0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (sum !== 0 || carry !== 1) begin
            $display("FAIL: Test case 4 failed (A=1, B=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule