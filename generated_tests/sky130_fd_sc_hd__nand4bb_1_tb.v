`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__nand4bb;

    // Inputs
    reg A_N;
    reg B_N;
    reg C;
    reg D;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__nand4bb uut (
        .Y(Y),
        .A_N(A_N),
        .B_N(B_N),
        .C(C),
        .D(D)
    );

    initial begin
        // Test case 1: A_N=0, B_N=0, C=0, D=0 => Y should be 1
        A_N = 0; B_N = 0; C = 0; D = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed, expected Y=1, got Y=%b", Y);

        // Test case 2: A_N=0, B_N=0, C=0, D=1 => Y should be 1
        A_N = 0; B_N = 0; C = 0; D = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed, expected Y=1, got Y=%b", Y);

        // Test case 3: A_N=0, B_N=0, C=1, D=0 => Y should be 1
        A_N = 0; B_N = 0; C = 1; D = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);

        // Test case 4: A_N=0, B_N=0, C=1, D=1 => Y should be 0
        A_N = 0; B_N = 0; C = 1; D = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 4 failed, expected Y=0, got Y=%b", Y);

        // Test case 5: A_N=1, B_N=1, C=0, D=0 => Y should be 1
        A_N = 1; B_N = 1; C = 0; D = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 5 failed, expected Y=1, got Y=%b", Y);

        // Test case 6: A_N=1, B_N=1, C=0, D=1 => Y should be 1
        A_N = 1; B_N = 1; C = 0; D = 1;
        #10;
        if (Y !== 1) $display("FAIL: Test case 6 failed, expected Y=1, got Y=%b", Y);

        // Test case 7: A_N=1, B_N=1, C=1, D=0 => Y should be 1
        A_N = 1; B_N = 1; C = 1; D = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 7 failed, expected Y=1, got Y=%b", Y);

        // Test case 8: A_N=1, B_N=1, C=1, D=1 => Y should be 0
        A_N = 1; B_N = 1; C = 1; D = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 8 failed, expected Y=0, got Y=%b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule