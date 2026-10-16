`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__nor4bb;

    // Inputs
    reg A;
    reg B;
    reg C_N;
    reg D_N;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__nor4bb uut (
        .Y(Y),
        .A(A),
        .B(B),
        .C_N(C_N),
        .D_N(D_N)
    );

    initial begin
        // Initialize Inputs
        A = 0; B = 0; C_N = 0; D_N = 0;

        // Test case 1: A=0, B=0, C_N=0, D_N=0
        #10;
        if (Y !== 0) $display("FAIL: Test case 1 failed, expected Y=0, got Y=%b", Y);

        // Test case 2: A=0, B=0, C_N=0, D_N=1
        D_N = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 2 failed, expected Y=0, got Y=%b", Y);

        // Test case 3: A=0, B=0, C_N=1, D_N=0
        C_N = 1; D_N = 0;
        #10;
        if (Y !== 0) $display("FAIL: Test case 3 failed, expected Y=0, got Y=%b", Y);

        // Test case 4: A=0, B=0, C_N=1, D_N=1
        D_N = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 4 failed, expected Y=1, got Y=%b", Y);

        // Test case 5: A=0, B=1, C_N=1, D_N=1
        B = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 5 failed, expected Y=0, got Y=%b", Y);

        // Test case 6: A=1, B=0, C_N=1, D_N=1
        A = 1; B = 0;
        #10;
        if (Y !== 0) $display("FAIL: Test case 6 failed, expected Y=0, got Y=%b", Y);

        // Test case 7: A=1, B=1, C_N=1, D_N=1
        A = 1; B = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 7 failed, expected Y=0, got Y=%b", Y);

        // Test case 8: A=0, B=0, C_N=0, D_N=0 (reset to initial)
        A = 0; B = 0; C_N = 0; D_N = 0;
        #10;
        if (Y !== 0) $display("FAIL: Test case 8 failed, expected Y=0, got Y=%b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule