`timescale 1ns/1ps

module tb_full_adder;

    // Inputs
    reg A;
    reg B;
    reg C;

    // Outputs
    wire sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .A(A),
        .B(B),
        .C(C),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test cases
        // Test case 1: A=0, B=0, C=0
        A = 0; B = 0; C = 0;
        #10;
        if (sum !== 0 || carry !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: A=0, B=0, C=1
        A = 0; B = 0; C = 1;
        #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: A=0, B=1, C=0
        A = 0; B = 1; C = 0;
        #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: A=0, B=1, C=1
        A = 0; B = 1; C = 1;
        #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: A=1, B=0, C=0
        A = 1; B = 0; C = 0;
        #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: A=1, B=0, C=1
        A = 1; B = 0; C = 1;
        #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: A=1, B=1, C=0
        A = 1; B = 1; C = 0;
        #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: A=1, B=1, C=1
        A = 1; B = 1; C = 1;
        #10;
        if (sum !== 1 || carry !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule