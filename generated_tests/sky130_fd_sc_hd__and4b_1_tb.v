`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__and4b;

    // Testbench signals
    reg A_N;
    reg B;
    reg C;
    reg D;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__and4b uut (
        .X(X),
        .A_N(A_N),
        .B(B),
        .C(C),
        .D(D)
    );

    initial begin
        // Test case 1: A_N = 0, B = 1, C = 1, D = 1 -> X should be 1
        A_N = 0; B = 1; C = 1; D = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 1 failed, expected X = 1, got X = %b", X);
            $finish;
        end

        // Test case 2: A_N = 1, B = 1, C = 1, D = 1 -> X should be 0
        A_N = 1; B = 1; C = 1; D = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 3: A_N = 0, B = 0, C = 1, D = 1 -> X should be 0
        A_N = 0; B = 0; C = 1; D = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 4: A_N = 0, B = 1, C = 0, D = 1 -> X should be 0
        A_N = 0; B = 1; C = 0; D = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 4 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 5: A_N = 0, B = 1, C = 1, D = 0 -> X should be 0
        A_N = 0; B = 1; C = 1; D = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 5 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 6: A_N = 1, B = 0, C = 0, D = 0 -> X should be 0
        A_N = 1; B = 0; C = 0; D = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 6 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule