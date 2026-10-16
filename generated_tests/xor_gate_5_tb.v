`timescale 1ns/1ps

module tb_xor_gate;

    // Inputs
    reg A;
    reg B;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    xor_gate uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (Y !== 0) $display("FAIL: Test case 1 failed (A=0, B=0, Y=%b)", Y);

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed (A=0, B=1, Y=%b)", Y);

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed (A=1, B=0, Y=%b)", Y);

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 4 failed (A=1, B=1, Y=%b)", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule