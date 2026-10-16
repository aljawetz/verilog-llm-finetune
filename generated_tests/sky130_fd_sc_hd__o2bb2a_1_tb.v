`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o2bb2a;

    // Inputs
    reg A1_N;
    reg A2_N;
    reg B1;
    reg B2;

    // Output
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__o2bb2a uut (
        .X(X),
        .A1_N(A1_N),
        .A2_N(A2_N),
        .B1(B1),
        .B2(B2)
    );

    initial begin
        // Test case 1: A1_N = 0, A2_N = 0, B1 = 0, B2 = 0
        A1_N = 0; A2_N = 0; B1 = 0; B2 = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);

        // Test case 2: A1_N = 0, A2_N = 0, B1 = 0, B2 = 1
        A1_N = 0; A2_N = 0; B1 = 0; B2 = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 2 failed, expected X=0, got X=%b", X);

        // Test case 3: A1_N = 0, A2_N = 1, B1 = 0, B2 = 0
        A1_N = 0; A2_N = 1; B1 = 0; B2 = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 3 failed, expected X=0, got X=%b", X);

        // Test case 4: A1_N = 1, A2_N = 0, B1 = 0, B2 = 0
        A1_N = 1; A2_N = 0; B1 = 0; B2 = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 4 failed, expected X=0, got X=%b", X);

        // Test case 5: A1_N = 1, A2_N = 1, B1 = 1, B2 = 1
        A1_N = 1; A2_N = 1; B1 = 1; B2 = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 5 failed, expected X=1, got X=%b", X);

        // Test case 6: A1_N = 1, A2_N = 1, B1 = 0, B2 = 1
        A1_N = 1; A2_N = 1; B1 = 0; B2 = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 6 failed, expected X=0, got X=%b", X);

        // Test case 7: A1_N = 0, A2_N = 1, B1 = 1, B2 = 1
        A1_N = 0; A2_N = 1; B1 = 1; B2 = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 7 failed, expected X=0, got X=%b", X);

        // Test case 8: A1_N = 0, A2_N = 0, B1 = 1, B2 = 1
        A1_N = 0; A2_N = 0; B1 = 1; B2 = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 8 failed, expected X=0, got X=%b", X);

        // Test case 9: A1_N = 1, A2_N = 0, B1 = 1, B2 = 1
        A1_N = 1; A2_N = 0; B1 = 1; B2 = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 9 failed, expected X=0, got X=%b", X);

        // Test case 10: A1_N = 1, A2_N = 1, B1 = 0, B2 = 0
        A1_N = 1; A2_N = 1; B1 = 0; B2 = 0;
        #10;
        if (X !== 1) $display("FAIL: Test case 10 failed, expected X=1, got X=%b", X);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule