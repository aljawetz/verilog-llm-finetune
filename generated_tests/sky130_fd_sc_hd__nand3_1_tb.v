`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__nand3;

    // Testbench signals
    reg A;
    reg B;
    reg C;
    wire Y;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__nand3 uut (
        .Y(Y),
        .A(A),
        .B(B),
        .C(C)
    );

    // Test procedure
    initial begin
        // Test case 1: A=0, B=0, C=0 -> Y should be 1
        A = 0; B = 0; C = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed, expected Y=1 but got Y=%b", Y);
            $finish;
        end

        // Test case 2: A=0, B=0, C=1 -> Y should be 1
        A = 0; B = 0; C = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 2 failed, expected Y=1 but got Y=%b", Y);
            $finish;
        end

        // Test case 3: A=0, B=1, C=0 -> Y should be 1
        A = 0; B = 1; C = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 3 failed, expected Y=1 but got Y=%b", Y);
            $finish;
        end

        // Test case 4: A=1, B=0, C=0 -> Y should be 1
        A = 1; B = 0; C = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 4 failed, expected Y=1 but got Y=%b", Y);
            $finish;
        end

        // Test case 5: A=1, B=1, C=0 -> Y should be 1
        A = 1; B = 1; C = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 5 failed, expected Y=1 but got Y=%b", Y);
            $finish;
        end

        // Test case 6: A=1, B=0, C=1 -> Y should be 1
        A = 1; B = 0; C = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 6 failed, expected Y=1 but got Y=%b", Y);
            $finish;
        end

        // Test case 7: A=0, B=1, C=1 -> Y should be 1
        A = 0; B = 1; C = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 7 failed, expected Y=1 but got Y=%b", Y);
            $finish;
        end

        // Test case 8: A=1, B=1, C=1 -> Y should be 0
        A = 1; B = 1; C = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 8 failed, expected Y=0 but got Y=%b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule