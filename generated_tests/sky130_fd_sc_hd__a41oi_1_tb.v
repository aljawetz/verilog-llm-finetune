`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__a41oi;

    // Inputs
    reg A1;
    reg A2;
    reg A3;
    reg A4;
    reg B1;

    // Output
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__a41oi uut (
        .Y(Y),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .B1(B1)
    );

    initial begin
        // Test case 1: All inputs low
        A1 = 0; A2 = 0; A3 = 0; A4 = 0; B1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 1 failed, expected Y=1, got Y=%b", Y);

        // Test case 2: Three inputs high, one low
        A1 = 1; A2 = 1; A3 = 1; A4 = 0; B1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 2 failed, expected Y=1, got Y=%b", Y);

        // Test case 3: All inputs high
        A1 = 1; A2 = 1; A3 = 1; A4 = 1; B1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);

        // Test case 4: All inputs high, B1 high
        A1 = 1; A2 = 1; A3 = 1; A4 = 1; B1 = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 4 failed, expected Y=0, got Y=%b", Y);

        // Test case 5: Mixed inputs
        A1 = 1; A2 = 0; A3 = 1; A4 = 1; B1 = 0;
        #10;
        if (Y !== 1) $display("FAIL: Test case 5 failed, expected Y=1, got Y=%b", Y);

        // Test case 6: Mixed inputs with B1 high
        A1 = 1; A2 = 0; A3 = 1; A4 = 1; B1 = 1;
        #10;
        if (Y !== 0) $display("FAIL: Test case 6 failed, expected Y=0, got Y=%b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule