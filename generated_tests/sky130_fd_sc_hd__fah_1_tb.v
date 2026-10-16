`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__fah;

    // Inputs
    reg A;
    reg B;
    reg CI;

    // Outputs
    wire COUT;
    wire SUM;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__fah uut (
        .COUT(COUT),
        .SUM(SUM),
        .A(A),
        .B(B),
        .CI(CI)
    );

    initial begin
        // Test case 1: A=0, B=0, CI=0 -> SUM=0, COUT=0
        A = 0; B = 0; CI = 0;
        #10;
        if (SUM !== 0 || COUT !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A=0, B=0, CI=1 -> SUM=1, COUT=0
        A = 0; B = 0; CI = 1;
        #10;
        if (SUM !== 1 || COUT !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A=0, B=1, CI=0 -> SUM=1, COUT=0
        A = 0; B = 1; CI = 0;
        #10;
        if (SUM !== 1 || COUT !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A=0, B=1, CI=1 -> SUM=0, COUT=1
        A = 0; B = 1; CI = 1;
        #10;
        if (SUM !== 0 || COUT !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A=1, B=0, CI=0 -> SUM=1, COUT=0
        A = 1; B = 0; CI = 0;
        #10;
        if (SUM !== 1 || COUT !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A=1, B=0, CI=1 -> SUM=0, COUT=1
        A = 1; B = 0; CI = 1;
        #10;
        if (SUM !== 0 || COUT !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: A=1, B=1, CI=0 -> SUM=0, COUT=1
        A = 1; B = 1; CI = 0;
        #10;
        if (SUM !== 0 || COUT !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: A=1, B=1, CI=1 -> SUM=1, COUT=1
        A = 1; B = 1; CI = 1;
        #10;
        if (SUM !== 1 || COUT !== 1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule