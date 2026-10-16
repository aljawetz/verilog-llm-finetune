`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__and3b;

    // Testbench signals
    reg A_N;
    reg B;
    reg C;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__and3b uut (
        .X(X),
        .A_N(A_N),
        .B(B),
        .C(C)
    );

    initial begin
        // Test case 1: A_N = 0, B = 0, C = 0 -> X should be 0
        A_N = 0; B = 0; C = 0; #10;
        if (X !== 0) $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);

        // Test case 2: A_N = 0, B = 0, C = 1 -> X should be 0
        A_N = 0; B = 0; C = 1; #10;
        if (X !== 0) $display("FAIL: Test case 2 failed, expected X=0, got X=%b", X);

        // Test case 3: A_N = 0, B = 1, C = 0 -> X should be 0
        A_N = 0; B = 1; C = 0; #10;
        if (X !== 0) $display("FAIL: Test case 3 failed, expected X=0, got X=%b", X);

        // Test case 4: A_N = 0, B = 1, C = 1 -> X should be 1
        A_N = 0; B = 1; C = 1; #10;
        if (X !== 1) $display("FAIL: Test case 4 failed, expected X=1, got X=%b", X);

        // Test case 5: A_N = 1, B = 0, C = 0 -> X should be 0
        A_N = 1; B = 0; C = 0; #10;
        if (X !== 0) $display("FAIL: Test case 5 failed, expected X=0, got X=%b", X);

        // Test case 6: A_N = 1, B = 0, C = 1 -> X should be 0
        A_N = 1; B = 0; C = 1; #10;
        if (X !== 0) $display("FAIL: Test case 6 failed, expected X=0, got X=%b", X);

        // Test case 7: A_N = 1, B = 1, C = 0 -> X should be 0
        A_N = 1; B = 1; C = 0; #10;
        if (X !== 0) $display("FAIL: Test case 7 failed, expected X=0, got X=%b", X);

        // Test case 8: A_N = 1, B = 1, C = 1 -> X should be 0
        A_N = 1; B = 1; C = 1; #10;
        if (X !== 0) $display("FAIL: Test case 8 failed, expected X=0, got X=%b", X);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule