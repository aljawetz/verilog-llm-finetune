`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__xnor3;

    // Inputs
    reg A;
    reg B;
    reg C;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__xnor3 uut (
        .X(X),
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Test case 1: A=0, B=0, C=0 -> X should be 1
        A = 0; B = 0; C = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 1 failed, expected X=1 but got X=%b", X);
            $finish;
        end

        // Test case 2: A=0, B=0, C=1 -> X should be 0
        A = 0; B = 0; C = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed, expected X=0 but got X=%b", X);
            $finish;
        end

        // Test case 3: A=0, B=1, C=0 -> X should be 0
        A = 0; B = 1; C = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed, expected X=0 but got X=%b", X);
            $finish;
        end

        // Test case 4: A=0, B=1, C=1 -> X should be 1
        A = 0; B = 1; C = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed, expected X=1 but got X=%b", X);
            $finish;
        end

        // Test case 5: A=1, B=0, C=0 -> X should be 0
        A = 1; B = 0; C = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 5 failed, expected X=0 but got X=%b", X);
            $finish;
        end

        // Test case 6: A=1, B=0, C=1 -> X should be 1
        A = 1; B = 0; C = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 6 failed, expected X=1 but got X=%b", X);
            $finish;
        end

        // Test case 7: A=1, B=1, C=0 -> X should be 1
        A = 1; B = 1; C = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 7 failed, expected X=1 but got X=%b", X);
            $finish;
        end

        // Test case 8: A=1, B=1, C=1 -> X should be 0
        A = 1; B = 1; C = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 8 failed, expected X=0 but got X=%b", X);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule