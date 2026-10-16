`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__dlymetal6s2s;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__dlymetal6s2s uut (
        .X(X),
        .A(A)
    );

    // Initial block for stimulus
    initial begin
        // Initialize input
        A = 0;

        // Wait for some time and check output
        #5;
        if (X !== 0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        // Change input
        A = 1;
        #5;
        if (X !== 1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        // Change input back
        A = 0;
        #5;
        if (X !== 0) begin
            $display("FAIL: Output X should be 0 when A is 0 again");
            $finish;
        end

        // Final check
        A = 1;
        #5;
        if (X !== 1) begin
            $display("FAIL: Output X should be 1 when A is set to 1 again");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule