`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__probec_p;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__probec_p uut (
        .X(X),
        .A(A)
    );

    initial begin
        // Initialize A
        A = 0;

        // Test sequence
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Output X is not as expected for A=0");
            $finish;
        end

        A = 1; // Change input A
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Output X is not as expected for A=1");
            $finish;
        end

        A = 0; // Change input A back to 0
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Output X is not as expected for A=0");
            $finish;
        end

        // Final check
        A = 1; // Change input A
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Output X is not as expected for A=1");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule