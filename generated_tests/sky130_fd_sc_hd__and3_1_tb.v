`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__and3;

    // Inputs
    reg A;
    reg B;
    reg C;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__and3 uut (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Test case 1: All inputs low
        A = 0; B = 0; C = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 1 failed (A=0, B=0, C=0)");

        // Test case 2: One input high
        A = 1; B = 0; C = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 2 failed (A=1, B=0, C=0)");

        // Test case 3: Two inputs high
        A = 1; B = 1; C = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 3 failed (A=1, B=1, C=0)");

        // Test case 4: All inputs high
        A = 1; B = 1; C = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 4 failed (A=1, B=1, C=1)");

        // Test case 5: Two inputs high, one low
        A = 0; B = 1; C = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 5 failed (A=0, B=1, C=1)");

        // Test case 6: Two inputs high, one low
        A = 1; B = 0; C = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 6 failed (A=1, B=0, C=1)");

        // Test case 7: Two inputs high, one low
        A = 1; B = 1; C = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 7 failed (A=1, B=1, C=0)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule