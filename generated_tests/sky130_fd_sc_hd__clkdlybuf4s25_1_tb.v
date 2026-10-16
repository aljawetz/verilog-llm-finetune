`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__clkdlybuf4s25;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__clkdlybuf4s25 uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Initialize A
        A = 0;

        // Test sequence
        #5 A = 1; // Change A to 1 after 5 ns
        #10;      // Wait for 10 ns
        if (X !== 1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        #5 A = 0; // Change A to 0 after 5 ns
        #10;      // Wait for 10 ns
        if (X !== 0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        #5 A = 1; // Change A to 1 again
        #10;      // Wait for 10 ns
        if (X !== 1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        #5 A = 0; // Change A to 0 again
        #10;      // Wait for 10 ns
        if (X !== 0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule