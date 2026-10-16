`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__clkdlybuf4s15;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__clkdlybuf4s15 uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Initialize A
        A = 0;

        // Wait for a short time
        #5;

        // Test sequence
        A = 1; // Change A to 1
        #10;   // Wait for two buffer delays
        if (X !== 1) begin
            $display("FAIL: Expected X to be 1 when A is 1");
            $finish;
        end

        A = 0; // Change A to 0
        #10;   // Wait for two buffer delays
        if (X !== 0) begin
            $display("FAIL: Expected X to be 0 when A is 0");
            $finish;
        end

        A = 1; // Change A to 1 again
        #10;   // Wait for two buffer delays
        if (X !== 1) begin
            $display("FAIL: Expected X to be 1 when A is 1");
            $finish;
        end

        // Final check
        A = 0; // Change A to 0 again
        #10;   // Wait for two buffer delays
        if (X !== 0) begin
            $display("FAIL: Expected X to be 0 when A is 0");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule