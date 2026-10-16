`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_clkbufkapwr;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__lpflow_clkbufkapwr uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Initialize inputs
        A = 0;

        // Test sequence
        #10; // Wait for 10 time units
        A = 1; // Change A to 1
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        A = 0; // Change A back to 0
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        // Additional test cases can be added here

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule