`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__ha;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire COUT;
    wire SUM;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__ha uut (
        .COUT(COUT),
        .SUM(SUM),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (COUT !== 0 || SUM !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (COUT !== 0 || SUM !== 1) begin
            $display("FAIL: Test case 2 failed (A=0, B=1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (COUT !== 0 || SUM !== 1) begin
            $display("FAIL: Test case 3 failed (A=1, B=0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (COUT !== 1 || SUM !== 0) begin
            $display("FAIL: Test case 4 failed (A=1, B=1)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule