`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_lsbuf_lh_hl_isowell_tap;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__lpflow_lsbuf_lh_hl_isowell_tap uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Test case 1: Check when A is 0
        A = 0;
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X to be 0 when A is 0, but got %b", X);
            $finish;
        end

        // Test case 2: Check when A is 1
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X to be 1 when A is 1, but got %b", X);
            $finish;
        end

        // Test case 3: Check when A changes from 0 to 1
        A = 0;
        #10; // Wait for 10 time units
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X to be 1 after A changes to 1, but got %b", X);
            $finish;
        end

        // Test case 4: Check when A changes from 1 to 0
        A = 1;
        #10; // Wait for 10 time units
        A = 0;
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X to be 0 after A changes to 0, but got %b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule