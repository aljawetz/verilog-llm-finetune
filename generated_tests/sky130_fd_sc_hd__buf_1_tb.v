`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__buf;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__buf uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Test case 1: Check output when A is 0
        A = 0;
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0, got X = %b", X);
            $finish;
        end

        // Test case 2: Check output when A is 1
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1, got X = %b", X);
            $finish;
        end

        // Test case 3: Check output when A changes from 0 to 1
        A = 0;
        #10; // Wait for 10 time units
        A = 1;
        #10; // Wait for 10 time units
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 after A changes to 1, got X = %b", X);
            $finish;
        end

        // Test case 4: Check output when A changes from 1 to 0
        A = 1;
        #10; // Wait for 10 time units
        A = 0;
        #10; // Wait for 10 time units
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 after A changes to 0, got X = %b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule