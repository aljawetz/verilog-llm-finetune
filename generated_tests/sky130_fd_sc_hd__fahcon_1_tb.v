`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__fahcon;

    // Inputs
    reg A;
    reg B;
    reg CI;

    // Outputs
    wire COUT_N;
    wire SUM;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__fahcon uut (
        .COUT_N(COUT_N),
        .SUM(SUM),
        .A(A),
        .B(B),
        .CI(CI)
    );

    initial begin
        // Test case 1: A=0, B=0, CI=0
        A = 0; B = 0; CI = 0;
        #10;
        if (SUM !== 0 || COUT_N !== 1) $display("FAIL: Test case 1 failed");
        
        // Test case 2: A=0, B=0, CI=1
        A = 0; B = 0; CI = 1;
        #10;
        if (SUM !== 1 || COUT_N !== 1) $display("FAIL: Test case 2 failed");
        
        // Test case 3: A=0, B=1, CI=0
        A = 0; B = 1; CI = 0;
        #10;
        if (SUM !== 1 || COUT_N !== 1) $display("FAIL: Test case 3 failed");
        
        // Test case 4: A=0, B=1, CI=1
        A = 0; B = 1; CI = 1;
        #10;
        if (SUM !== 0 || COUT_N !== 0) $display("FAIL: Test case 4 failed");
        
        // Test case 5: A=1, B=0, CI=0
        A = 1; B = 0; CI = 0;
        #10;
        if (SUM !== 1 || COUT_N !== 1) $display("FAIL: Test case 5 failed");
        
        // Test case 6: A=1, B=0, CI=1
        A = 1; B = 0; CI = 1;
        #10;
        if (SUM !== 0 || COUT_N !== 0) $display("FAIL: Test case 6 failed");
        
        // Test case 7: A=1, B=1, CI=0
        A = 1; B = 1; CI = 0;
        #10;
        if (SUM !== 0 || COUT_N !== 0) $display("FAIL: Test case 7 failed");
        
        // Test case 8: A=1, B=1, CI=1
        A = 1; B = 1; CI = 1;
        #10;
        if (SUM !== 1 || COUT_N !== 0) $display("FAIL: Test case 8 failed");

        $display("PASS");
        $finish;
    end

endmodule