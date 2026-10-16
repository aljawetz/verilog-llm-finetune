`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__or2;

    // Inputs
    reg A;
    reg B;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__or2 uut (
        .X(X),
        .A(A),
        .B(B)
    );

    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;

        // Wait for global reset to finish
        #10;

        // Test cases
        // Test case 1: A = 0, B = 0 -> X should be 0
        A = 0; B = 0;
        #10;
        if (X !== 1'b0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0)");
            $finish;
        end

        // Test case 2: A = 0, B = 1 -> X should be 1
        A = 0; B = 1;
        #10;
        if (X !== 1'b1) begin
            $display("FAIL: Test case 2 failed (A=0, B=1)");
            $finish;
        end

        // Test case 3: A = 1, B = 0 -> X should be 1
        A = 1; B = 0;
        #10;
        if (X !== 1'b1) begin
            $display("FAIL: Test case 3 failed (A=1, B=0)");
            $finish;
        end

        // Test case 4: A = 1, B = 1 -> X should be 1
        A = 1; B = 1;
        #10;
        if (X !== 1'b1) begin
            $display("FAIL: Test case 4 failed (A=1, B=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule