`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__fahcin;

    // Inputs
    reg A;
    reg B;
    reg CIN;

    // Outputs
    wire COUT;
    wire SUM;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__fahcin uut (
        .COUT(COUT),
        .SUM(SUM),
        .A(A),
        .B(B),
        .CIN(CIN)
    );

    initial begin
        // Test case 1: A=0, B=0, CIN=0
        A = 0; B = 0; CIN = 0;
        #10;
        if (SUM !== 0 || COUT !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: A=0, B=0, CIN=1
        A = 0; B = 0; CIN = 1;
        #10;
        if (SUM !== 1 || COUT !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: A=0, B=1, CIN=0
        A = 0; B = 1; CIN = 0;
        #10;
        if (SUM !== 1 || COUT !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: A=0, B=1, CIN=1
        A = 0; B = 1; CIN = 1;
        #10;
        if (SUM !== 0 || COUT !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: A=1, B=0, CIN=0
        A = 1; B = 0; CIN = 0;
        #10;
        if (SUM !== 1 || COUT !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: A=1, B=0, CIN=1
        A = 1; B = 0; CIN = 1;
        #10;
        if (SUM !== 0 || COUT !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: A=1, B=1, CIN=0
        A = 1; B = 1; CIN = 0;
        #10;
        if (SUM !== 0 || COUT !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: A=1, B=1, CIN=1
        A = 1; B = 1; CIN = 1;
        #10;
        if (SUM !== 1 || COUT !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule