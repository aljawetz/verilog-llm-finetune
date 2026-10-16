`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o221ai;

    // Inputs
    reg A1;
    reg A2;
    reg B1;
    reg B2;
    reg C1;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__o221ai uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2),
        .C1(C1)
    );

    initial begin
        // Initialize Inputs
        A1 = 0; A2 = 0; B1 = 0; B2 = 0; C1 = 0;

        // Test case 1: All inputs low
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed, expected Y=1, got Y=%b", Y);

        // Test case 2: A1=1, A2=0, B1=0, B2=0, C1=0
        A1 = 1; A2 = 0; B1 = 0; B2 = 0; C1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed, expected Y=1, got Y=%b", Y);

        // Test case 3: A1=0, A2=1, B1=0, B2=0, C1=0
        A1 = 0; A2 = 1; B1 = 0; B2 = 0; C1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);

        // Test case 4: A1=0, A2=0, B1=1, B2=0, C1=0
        A1 = 0; A2 = 0; B1 = 1; B2 = 0; C1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 4 failed, expected Y=1, got Y=%b", Y);

        // Test case 5: A1=0, A2=0, B1=0, B2=1, C1=0
        A1 = 0; A2 = 0; B1 = 0; B2 = 1; C1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 5 failed, expected Y=1, got Y=%b", Y);

        // Test case 6: A1=1, A2=1, B1=1, B2=1, C1=1
        A1 = 1; A2 = 1; B1 = 1; B2 = 1; C1 = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 6 failed, expected Y=0, got Y=%b", Y);

        // Test case 7: A1=1, A2=1, B1=1, B2=1, C1=0
        A1 = 1; A2 = 1; B1 = 1; B2 = 1; C1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 7 failed, expected Y=1, got Y=%b", Y);

        // Test case 8: A1=0, A2=0, B1=0, B2=0, C1=1
        A1 = 0; A2 = 0; B1 = 0; B2 = 0; C1 = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 8 failed, expected Y=0, got Y=%b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule