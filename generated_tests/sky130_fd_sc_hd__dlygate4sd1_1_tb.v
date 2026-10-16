`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__dlygate4sd1;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__dlygate4sd1 uut (
        .X(X),
        .A(A)
    );

    initial begin
        // Initialize A
        A = 0;

        // Test sequence
        #5;  // Wait for 5 time units
        A = 1; // Change A to 1
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        #5;  // Wait for 5 time units
        A = 0; // Change A back to 0
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        // Additional test case
        #5;  // Wait for 5 time units
        A = 1; // Change A to 1 again
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        // Final check
        #5;  // Wait for 5 time units
        A = 0; // Change A back to 0
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule