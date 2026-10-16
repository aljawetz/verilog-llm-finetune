`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__or2b;

    // Inputs
    reg A;
    reg B_N;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__or2b uut (
        .X(X),
        .A(A),
        .B_N(B_N)
    );

    initial begin
        // Initialize Inputs
        A = 0;
        B_N = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: A = 0, B_N = 0 -> X should be 1
        A = 0; B_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 1 failed (A=0, B_N=0)");
            $finish;
        end

        // Test case 2: A = 0, B_N = 1 -> X should be 0
        A = 0; B_N = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed (A=0, B_N=1)");
            $finish;
        end

        // Test case 3: A = 1, B_N = 0 -> X should be 1
        A = 1; B_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 3 failed (A=1, B_N=0)");
            $finish;
        end

        // Test case 4: A = 1, B_N = 1 -> X should be 1
        A = 1; B_N = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed (A=1, B_N=1)");
            $finish;
        end

        // Test case 5: A = 0, B_N = 0 -> X should be 1 (retesting)
        A = 0; B_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 5 failed (A=0, B_N=0)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule