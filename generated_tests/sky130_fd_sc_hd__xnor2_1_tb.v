`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__xnor2;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire Y;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__xnor2 uut (
        .Y(Y),
        .A(A),
        .B(B)
    );

    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed (A=0, B=0) - Expected Y=1, got Y=%b", Y);
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 2 failed (A=0, B=1) - Expected Y=0, got Y=%b", Y);
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (Y !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B=0) - Expected Y=0, got Y=%b", Y);
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (Y !== 1) begin
            $display("FAIL: Test case 4 failed (A=1, B=1) - Expected Y=1, got Y=%b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule