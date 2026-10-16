`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__and2;

    // Testbench signals
    reg A;
    reg B;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__and2 uut (
        .X(X),
        .A(A),
        .B(B)
    );

    // Test procedure
    initial begin
        // Test case 1: A = 0, B = 0
        A = 0; B = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, B=0, X=%b)", X);
            $finish;
        end

        // Test case 2: A = 0, B = 1
        A = 0; B = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed (A=0, B=1, X=%b)", X);
            $finish;
        end

        // Test case 3: A = 1, B = 0
        A = 1; B = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed (A=1, B=0, X=%b)", X);
            $finish;
        end

        // Test case 4: A = 1, B = 1
        A = 1; B = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed (A=1, B=1, X=%b)", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule