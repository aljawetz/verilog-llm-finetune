`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__or4bb;

    // Inputs
    reg A;
    reg B;
    reg C_N;
    reg D_N;

    // Output
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__or4bb uut (
        .X(X),
        .A(A),
        .B(B),
        .C_N(C_N),
        .D_N(D_N)
    );

    initial begin
        // Initialize Inputs
        A = 0; B = 0; C_N = 0; D_N = 0;

        // Test case 1: A=0, B=0, C_N=0, D_N=0 => X should be 0
        #10;
        if (X !== 0) $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);

        // Test case 2: A=0, B=0, C_N=0, D_N=1 => X should be 1 (NAND of 0 and 1 is 1)
        D_N = 1; #10;
        if (X !== 1) $display("FAIL: Test case 2 failed, expected X=1, got X=%b", X);

        // Test case 3: A=0, B=1, C_N=0, D_N=1 => X should be 1 (OR of 0, 1, and 1)
        A = 0; B = 1; #10;
        if (X !== 1) $display("FAIL: Test case 3 failed, expected X=1, got X=%b", X);

        // Test case 4: A=1, B=0, C_N=1, D_N=1 => X should be 1 (OR of 1, 0, and 1)
        A = 1; B = 0; C_N = 1; D_N = 1; #10;
        if (X !== 1) $display("FAIL: Test case 4 failed, expected X=1, got X=%b", X);

        // Test case 5: A=1, B=1, C_N=0, D_N=0 => X should be 1 (OR of 1, 1, and 1)
        A = 1; B = 1; C_N = 0; D_N = 0; #10;
        if (X !== 1) $display("FAIL: Test case 5 failed, expected X=1, got X=%b", X);

        // Test case 6: A=0, B=0, C_N=1, D_N=0 => X should be 1 (OR of 0, 0, and 1)
        A = 0; B = 0; C_N = 1; D_N = 0; #10;
        if (X !== 1) $display("FAIL: Test case 6 failed, expected X=1, got X=%b", X);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule