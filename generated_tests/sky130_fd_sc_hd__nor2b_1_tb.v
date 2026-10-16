`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__nor2b;

    // Testbench signals
    reg A;
    reg B_N;
    wire Y;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__nor2b uut (
        .Y(Y),
        .A(A),
        .B_N(B_N)
    );

    initial begin
        // Test case 1: A = 0, B_N = 0
        A = 0; B_N = 0;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B_N=0, Y=%b)", Y);
            $finish;
        end

        // Test case 2: A = 0, B_N = 1
        A = 0; B_N = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 2 failed (A=0, B_N=1, Y=%b)", Y);
            $finish;
        end

        // Test case 3: A = 1, B_N = 0
        A = 1; B_N = 0;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B_N=0, Y=%b)", Y);
            $finish;
        end

        // Test case 4: A = 1, B_N = 1
        A = 1; B_N = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 4 failed (A=1, B_N=1, Y=%b)", Y);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule