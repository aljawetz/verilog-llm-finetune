`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__dlymetal6s4s;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__dlymetal6s4s uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Initialize input
        A = 0;

        // Wait for some time and check output
        #10;
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0, but got X = %b", X);
            $finish;
        end

        // Change input
        A = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1, but got X = %b", X);
            $finish;
        end

        // Change input back
        A = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0, but got X = %b", X);
            $finish;
        end

        // Final check
        A = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1, but got X = %b", X);
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule