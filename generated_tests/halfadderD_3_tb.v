`timescale 1ns/1ps

module tb_halfadderD;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    halfadderD uut (
        .sum(sum),
        .carry(carry),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: A=0, B=0
        A = 0; B = 0;
        #10;
        if (sum !== 0 || carry !== 0) begin
            $display("FAIL: Test case A=0, B=0 failed");
            $finish;
        end

        // Test case 2: A=0, B=1
        A = 0; B = 1;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case A=0, B=1 failed");
            $finish;
        end

        // Test case 3: A=1, B=0
        A = 1; B = 0;
        #10;
        if (sum !== 1 || carry !== 0) begin
            $display("FAIL: Test case A=1, B=0 failed");
            $finish;
        end

        // Test case 4: A=1, B=1
        A = 1; B = 1;
        #10;
        if (sum !== 0 || carry !== 1) begin
            $display("FAIL: Test case A=1, B=1 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule