`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__or4b;

    // Inputs
    reg A;
    reg B;
    reg C;
    reg D_N;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__or4b uut (
        .X(X),
        .A(A),
        .B(B),
        .C(C),
        .D_N(D_N)
    );

    initial begin
        // Initialize Inputs
        A = 0; B = 0; C = 0; D_N = 1;

        // Wait for global reset to finish
        #10;

        // Test case 1: D_N = 1, A = 0, B = 0, C = 0 => X should be 0
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed, expected X=0, got X=%b", X);
            $finish;
        end

        // Test case 2: D_N = 1, A = 1, B = 0, C = 0 => X should be 1
        A = 1; B = 0; C = 0; D_N = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 2 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 3: D_N = 1, A = 0, B = 1, C = 0 => X should be 1
        A = 0; B = 1; C = 0; D_N = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 3 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 4: D_N = 1, A = 0, B = 0, C = 1 => X should be 1
        A = 0; B = 0; C = 1; D_N = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 5: D_N = 0, A = 0, B = 0, C = 0 => X should be 1 (D_N inverted)
        A = 0; B = 0; C = 0; D_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 5 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 6: D_N = 0, A = 1, B = 1, C = 1 => X should be 1 (D_N inverted)
        A = 1; B = 1; C = 1; D_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 6 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 7: D_N = 0, A = 1, B = 0, C = 0 => X should be 1 (D_N inverted)
        A = 1; B = 0; C = 0; D_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 7 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 8: D_N = 0, A = 0, B = 1, C = 0 => X should be 1 (D_N inverted)
        A = 0; B = 1; C = 0; D_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 8 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // Test case 9: D_N = 0, A = 0, B = 0, C = 1 => X should be 1 (D_N inverted)
        A = 0; B = 0; C = 1; D_N = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 9 failed, expected X=1, got X=%b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule