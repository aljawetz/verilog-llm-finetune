`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o41ai;

    // Inputs
    reg A1;
    reg A2;
    reg A3;
    reg A4;
    reg B1;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__o41ai uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .B1(B1)
    );

    initial begin
        // Initialize Inputs
        A1 = 0; A2 = 0; A3 = 0; A4 = 0; B1 = 0;

        // Test case 1: All inputs low
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed (All inputs low)");

        // Test case 2: B1 high, A1 high
        A1 = 1; B1 = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 2 failed (B1 high, A1 high)");

        // Test case 3: B1 high, A2 high
        A1 = 0; A2 = 1; B1 = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 3 failed (B1 high, A2 high)");

        // Test case 4: B1 high, A3 high
        A1 = 0; A2 = 0; A3 = 1; B1 = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 4 failed (B1 high, A3 high)");

        // Test case 5: B1 high, A4 high
        A1 = 0; A2 = 0; A3 = 0; A4 = 1; B1 = 1; #10;
        if (Y !== 0) $display("FAIL: Test case 5 failed (B1 high, A4 high)");

        // Test case 6: B1 low, all inputs high
        A1 = 1; A2 = 1; A3 = 1; A4 = 1; B1 = 0; #10;
        if (Y !== 1) $display("FAIL: Test case 6 failed (B1 low, all inputs high)");

        // Test case 7: B1 low, some inputs high
        A1 = 1; A2 = 1; A3 = 0; A4 = 1; B1 = 0; #10;
        if (Y !== 1) $display("FAIL: Test case 7 failed (B1 low, some inputs high)");

        // Test case 8: B1 low, all inputs low
        A1 = 0; A2 = 0; A3 = 0; A4 = 0; B1 = 0; #10;
        if (Y !== 1) $display("FAIL: Test case 8 failed (B1 low, all inputs low)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule