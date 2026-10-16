`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__o22a;

    // Inputs
    reg A1;
    reg A2;
    reg B1;
    reg B2;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__o22a uut (
        .X(X),
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2)
    );

    initial begin
        // Initialize Inputs
        A1 = 0; A2 = 0; B1 = 0; B2 = 0;

        // Test case 1: A1=0, A2=0, B1=0, B2=0 -> X should be 0
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 2: A1=1, A2=0, B1=0, B2=0 -> X should be 0
        A1 = 1; A2 = 0; B1 = 0; B2 = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 3: A1=0, A2=1, B1=0, B2=0 -> X should be 0
        A1 = 0; A2 = 1; B1 = 0; B2 = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 4: A1=0, A2=0, B1=1, B2=0 -> X should be 0
        A1 = 0; A2 = 0; B1 = 1; B2 = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 4 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 5: A1=1, A2=1, B1=0, B2=0 -> X should be 0
        A1 = 1; A2 = 1; B1 = 0; B2 = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 5 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 6: A1=1, A2=0, B1=1, B2=0 -> X should be 1
        A1 = 1; A2 = 0; B1 = 1; B2 = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 6 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 7: A1=0, A2=1, B1=1, B2=0 -> X should be 1
        A1 = 0; A2 = 1; B1 = 1; B2 = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 7 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 8: A1=1, A2=1, B1=1, B2=1 -> X should be 1
        A1 = 1; A2 = 1; B1 = 1; B2 = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 8 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule