`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__clkdlybuf4s18;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__clkdlybuf4s18 uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Initialize inputs
        A = 0;

        // Test sequence
        #10 A = 1; // Apply input A = 1
        #10 if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1");
            $finish;
        end

        #10 A = 0; // Apply input A = 0
        #10 if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0");
            $finish;
        end

        #10 A = 1; // Apply input A = 1 again
        #10 if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1");
            $finish;
        end

        #10 A = 0; // Apply input A = 0 again
        #10 if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0");
            $finish;
        end

        // Final check
        #10;
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 after final reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule