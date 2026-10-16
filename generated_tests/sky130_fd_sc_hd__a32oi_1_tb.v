`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__a32oi;

    // Inputs
    reg A1;
    reg A2;
    reg A3;
    reg B1;
    reg B2;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__a32oi uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .B1(B1),
        .B2(B2)
    );

    initial begin
        // Initialize inputs
        A1 = 0; A2 = 0; A3 = 0; B1 = 0; B2 = 0;

        // Test case 1: All inputs low
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 1 failed (All inputs low)");

        // Test case 2: A1, A2, A3 high, B1, B2 low
        A1 = 1; A2 = 1; A3 = 1; B1 = 0; B2 = 0;
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 2 failed (A1, A2, A3 high, B1, B2 low)");

        // Test case 3: A1, A2 low, A3 high, B1, B2 high
        A1 = 0; A2 = 0; A3 = 1; B1 = 1; B2 = 1;
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 3 failed (A1, A2 low, A3 high, B1, B2 high)");

        // Test case 4: A1, A2 high, A3 low, B1, B2 high
        A1 = 1; A2 = 1; A3 = 0; B1 = 1; B2 = 1;
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 4 failed (A1, A2 high, A3 low, B1, B2 high)");

        // Test case 5: A1, A2, A3 high, B1, B2 high
        A1 = 1; A2 = 1; A3 = 1; B1 = 1; B2 = 1;
        #10;
        if (Y !== 1'b1) $display("FAIL: Test case 5 failed (A1, A2, A3 high, B1, B2 high)");

        // Test case 6: A1, A2 high, A3 low, B1 low, B2 high
        A1 = 1; A2 = 1; A3 = 0; B1 = 0; B2 = 1;
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 6 failed (A1, A2 high, A3 low, B1 low, B2 high)");

        // Test case 7: A1 low, A2 high, A3 high, B1 high, B2 low
        A1 = 0; A2 = 1; A3 = 1; B1 = 1; B2 = 0;
        #10;
        if (Y !== 1'b0) $display("FAIL: Test case 7 failed (A1 low, A2 high, A3 high, B1 high, B2 low)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule