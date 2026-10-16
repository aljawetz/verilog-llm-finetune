`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__bufbuf;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__bufbuf uut (
        .X(X),
        .A(A)
    );

    initial begin
        // Initialize input
        A = 0;

        // Test sequence
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X = 0, got X = %b", X);
            $finish;
        end

        // Change input
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X = 1, got X = %b", X);
            $finish;
        end

        // Change input back
        A = 0;
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X = 0, got X = %b", X);
            $finish;
        end

        // Final check
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X = 1, got X = %b", X);
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule