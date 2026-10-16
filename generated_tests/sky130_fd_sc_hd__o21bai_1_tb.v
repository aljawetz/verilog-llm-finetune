`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o21bai;

    // Testbench signals
    reg A1;
    reg A2;
    reg B1_N;
    wire Y;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__o21bai uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1_N(B1_N)
    );

    initial begin
        // Test case 1: A1 = 0, A2 = 0, B1_N = 0
        A1 = 0; A2 = 0; B1_N = 0; #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed (A1=0, A2=0, B1_N=0)"); 

        // Test case 2: A1 = 0, A2 = 1, B1_N = 0
        A1 = 0; A2 = 1; B1_N = 0; #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed (A1=0, A2=1, B1_N=0)"); 

        // Test case 3: A1 = 1, A2 = 0, B1_N = 0
        A1 = 1; A2 = 0; B1_N = 0; #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed (A1=1, A2=0, B1_N=0)"); 

        // Test case 4: A1 = 1, A2 = 1, B1_N = 0
        A1 = 1; A2 = 1; B1_N = 0; #10;
        if (Y !== 1) $display("FAIL: Test case 4 failed (A1=1, A2=1, B1_N=0)"); 

        // Test case 5: A1 = 0, A2 = 0, B1_N = 1
        A1 = 0; A2 = 0; B1_N = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 5 failed (A1=0, A2=0, B1_N=1)"); 

        // Test case 6: A1 = 0, A2 = 1, B1_N = 1
        A1 = 0; A2 = 1; B1_N = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 6 failed (A1=0, A2=1, B1_N=1)"); 

        // Test case 7: A1 = 1, A2 = 0, B1_N = 1
        A1 = 1; A2 = 0; B1_N = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 7 failed (A1=1, A2=0, B1_N=1)"); 

        // Test case 8: A1 = 1, A2 = 1, B1_N = 1
        A1 = 1; A2 = 1; B1_N = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 8 failed (A1=1, A2=1, B1_N=1)"); 

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule