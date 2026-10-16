`timescale 1ns/1ps

module tb_gp_window;

    // Inputs
    reg g_iplus1;
    reg gi;
    reg p_iplus1;
    reg pi;

    // Outputs
    wire g_window;
    wire p_window;

    // Instantiate the Unit Under Test (UUT)
    gp_window uut (
        .g_iplus1(g_iplus1),
        .gi(gi),
        .p_iplus1(p_iplus1),
        .pi(pi),
        .g_window(g_window),
        .p_window(p_window)
    );

    initial begin
        // Test case 1
        g_iplus1 = 0; gi = 0; p_iplus1 = 0; pi = 0;
        #10;
        if (g_window !== 0 || p_window !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2
        g_iplus1 = 0; gi = 0; p_iplus1 = 0; pi = 1;
        #10;
        if (g_window !== 0 || p_window !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3
        g_iplus1 = 0; gi = 1; p_iplus1 = 1; pi = 1;
        #10;
        if (g_window !== 1 || p_window !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4
        g_iplus1 = 1; gi = 0; p_iplus1 = 1; pi = 0;
        #10;
        if (g_window !== 1 || p_window !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5
        g_iplus1 = 1; gi = 1; p_iplus1 = 1; pi = 1;
        #10;
        if (g_window !== 1 || p_window !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6
        g_iplus1 = 1; gi = 1; p_iplus1 = 0; pi = 1;
        #10;
        if (g_window !== 1 || p_window !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7
        g_iplus1 = 0; gi = 1; p_iplus1 = 1; pi = 0;
        #10;
        if (g_window !== 1 || p_window !== 1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule