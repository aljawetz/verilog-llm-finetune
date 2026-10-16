`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__nand3b;

    // Testbench signals
    reg A_N;
    reg B;
    reg C;
    wire Y;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__nand3b uut (
        .Y(Y),
        .A_N(A_N),
        .B(B),
        .C(C)
    );

    initial begin
        // Test case 1: A_N = 0, B = 0, C = 0
        A_N = 0; B = 0; C = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed (A_N=0, B=0, C=0)"); 

        // Test case 2: A_N = 0, B = 0, C = 1
        A_N = 0; B = 0; C = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed (A_N=0, B=0, C=1)"); 

        // Test case 3: A_N = 0, B = 1, C = 0
        A_N = 0; B = 1; C = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed (A_N=0, B=1, C=0)"); 

        // Test case 4: A_N = 0, B = 1, C = 1
        A_N = 0; B = 1; C = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 4 failed (A_N=0, B=1, C=1)"); 

        // Test case 5: A_N = 1, B = 0, C = 0
        A_N = 1; B = 0; C = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 5 failed (A_N=1, B=0, C=0)"); 

        // Test case 6: A_N = 1, B = 0, C = 1
        A_N = 1; B = 0; C = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 6 failed (A_N=1, B=0, C=1)"); 

        // Test case 7: A_N = 1, B = 1, C = 0
        A_N = 1; B = 1; C = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 7 failed (A_N=1, B=1, C=0)"); 

        // Test case 8: A_N = 1, B = 1, C = 1
        A_N = 1; B = 1; C = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 8 failed (A_N=1, B=1, C=1)"); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule