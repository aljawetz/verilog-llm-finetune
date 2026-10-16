`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__inv;

    // Testbench signals
    reg A;
    wire Y;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__inv uut (
        .Y(Y),
        .A(A)
    );

    // Test procedure
    initial begin
        // Test case 1: A = 0, expect Y = 1
        A = 0;
        #10; // Wait for 10 time units
        if (Y !== 1) begin
            $display("FAIL: Test case 1 failed, expected Y = 1 but got Y = %b", Y);
            $finish;
        end

        // Test case 2: A = 1, expect Y = 0
        A = 1;
        #10; // Wait for 10 time units
        if (Y !== 0) begin
            $display("FAIL: Test case 2 failed, expected Y = 0 but got Y = %b", Y);
            $finish;
        end

        // Test case 3: A toggling
        A = 0;
        #10; // Wait for 10 time units
        if (Y !== 1) begin
            $display("FAIL: Test case 3 failed, expected Y = 1 but got Y = %b", Y);
            $finish;
        end

        A = 1;
        #10; // Wait for 10 time units
        if (Y !== 0) begin
            $display("FAIL: Test case 3 failed, expected Y = 0 but got Y = %b", Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule