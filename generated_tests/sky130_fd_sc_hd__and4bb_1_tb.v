`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__and4bb;

    // Inputs
    reg A_N;
    reg B_N;
    reg C;
    reg D;

    // Output
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__and4bb uut (
        .X(X),
        .A_N(A_N),
        .B_N(B_N),
        .C(C),
        .D(D)
    );

    initial begin
        // Test case 1: A_N = 1, B_N = 1, C = 0, D = 0; Expect X = 0
        A_N = 1; B_N = 1; C = 0; D = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 1 failed, expected X = 0, got X = %b", X);

        // Test case 2: A_N = 1, B_N = 1, C = 1, D = 1; Expect X = 0
        A_N = 1; B_N = 1; C = 1; D = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 2 failed, expected X = 0, got X = %b", X);

        // Test case 3: A_N = 0, B_N = 0, C = 1, D = 1; Expect X = 1
        A_N = 0; B_N = 0; C = 1; D = 1;
        #10;
        if (X !== 1) $display("FAIL: Test case 3 failed, expected X = 1, got X = %b", X);

        // Test case 4: A_N = 0, B_N = 1, C = 1, D = 1; Expect X = 0
        A_N = 0; B_N = 1; C = 1; D = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 4 failed, expected X = 0, got X = %b", X);

        // Test case 5: A_N = 1, B_N = 0, C = 1, D = 1; Expect X = 0
        A_N = 1; B_N = 0; C = 1; D = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 5 failed, expected X = 0, got X = %b", X);

        // Test case 6: A_N = 0, B_N = 0, C = 0, D = 1; Expect X = 0
        A_N = 0; B_N = 0; C = 0; D = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 6 failed, expected X = 0, got X = %b", X);

        // Test case 7: A_N = 0, B_N = 0, C = 1, D = 0; Expect X = 0
        A_N = 0; B_N = 0; C = 1; D = 0;
        #10;
        if (X !== 0) $display("FAIL: Test case 7 failed, expected X = 0, got X = %b", X);

        // Test case 8: A_N = 1, B_N = 1, C = 0, D = 1; Expect X = 0
        A_N = 1; B_N = 1; C = 0; D = 1;
        #10;
        if (X !== 0) $display("FAIL: Test case 8 failed, expected X = 0, got X = %b", X);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule