`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__a21bo;

    // Inputs
    reg A1;
    reg A2;
    reg B1_N;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__a21bo uut (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1_N(B1_N)
    );

    initial begin
        // Initialize Inputs
        A1 = 0; A2 = 0; B1_N = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: A1 = 0, A2 = 0, B1_N = 0
        A1 = 0; A2 = 0; B1_N = 0;
        #10;
        if (X !== 1) $display("FAIL: Test case 1 failed, expected X=1, got X=%b", X);

        // Test case 2: A1 = 0, A2 = 1, B1_N = 0
        A1 = 0; A2 = 1; B1_N = 0;
        #10;
        if (X !== 1) $display("FAIL: Test case 2 failed, expected X=1, got X=%b", X);

        // Test case 3: A1 = 1, A2 = 0, B1_N = 0
        A1 = 1; A2 = 0; B1_N = 0;
        #10;
        if (X !== 1) $display("FAIL: Test case 3 failed, expected X=1, got X=%b", X);

        // Test case 4: A1 = 1, A2 = 1, B1_N = 0
        A1 = 1; A2 = 1; B1_N = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 4 failed, expected X=0, got X=%b", X);

        // Test case 5: A1 = 0, A2 = 0, B1_N = 1
        A1 = 0; A2 = 0; B1_N = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 5 failed, expected X=1, got X=%b", X);

        // Test case 6: A1 = 0, A2 = 1, B1_N = 1
        A1 = 0; A2 = 1; B1_N = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 6 failed, expected X=1, got X=%b", X);

        // Test case 7: A1 = 1, A2 = 0, B1_N = 1
        A1 = 1; A2 = 0; B1_N = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 7 failed, expected X=1, got X=%b", X);

        // Test case 8: A1 = 1, A2 = 1, B1_N = 1
        A1 = 1; A2 = 1; B1_N = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 8 failed, expected X=0, got X=%b", X);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule