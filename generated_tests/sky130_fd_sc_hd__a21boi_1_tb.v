`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__a21boi;

    // Inputs
    reg A1;
    reg A2;
    reg B1_N;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__a21boi uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1_N(B1_N)
    );

    initial begin
        // Test case 1: A1 = 0, A2 = 0, B1_N = 0
        A1 = 0; A2 = 0; B1_N = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed, expected Y = 1, got Y = %b", Y);

        // Test case 2: A1 = 0, A2 = 1, B1_N = 0
        A1 = 0; A2 = 1; B1_N = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed, expected Y = 1, got Y = %b", Y);

        // Test case 3: A1 = 1, A2 = 0, B1_N = 0
        A1 = 1; A2 = 0; B1_N = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed, expected Y = 1, got Y = %b", Y);

        // Test case 4: A1 = 1, A2 = 1, B1_N = 0
        A1 = 1; A2 = 1; B1_N = 0;
        #10;
        if (Y !== 0) $display("FAIL: Test case 4 failed, expected Y = 0, got Y = %b", Y);

        // Test case 5: A1 = 0, A2 = 0, B1_N = 1
        A1 = 0; A2 = 0; B1_N = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 5 failed, expected Y = 0, got Y = %b", Y);

        // Test case 6: A1 = 0, A2 = 1, B1_N = 1
        A1 = 0; A2 = 1; B1_N = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 6 failed, expected Y = 0, got Y = %b", Y);

        // Test case 7: A1 = 1, A2 = 0, B1_N = 1
        A1 = 1; A2 = 0; B1_N = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 7 failed, expected Y = 0, got Y = %b", Y);

        // Test case 8: A1 = 1, A2 = 1, B1_N = 1
        A1 = 1; A2 = 1; B1_N = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 8 failed, expected Y = 0, got Y = %b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule