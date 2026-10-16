`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__dlygate4sd3;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__dlygate4sd3 uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Test sequence
        // Test case 1: A = 0
        A = 0;
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0, got X = %b", X);
            $finish;
        end

        // Test case 2: A = 1
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1, got X = %b", X);
            $finish;
        end

        // Test case 3: A = 0 again
        A = 0;
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0, got X = %b", X);
            $finish;
        end

        // Test case 4: A = 1 again
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1, got X = %b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule