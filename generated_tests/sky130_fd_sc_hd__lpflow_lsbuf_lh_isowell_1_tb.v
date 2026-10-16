`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_lsbuf_lh_isowell;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__lpflow_lsbuf_lh_isowell uut (
        .X(X),
        .A(A)
    );

    // Test sequence
    initial begin
        // Initialize A
        A = 1'b0;

        // Wait for some time and check output
        #10;
        if (X !== 1'b0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        // Change A to 1
        A = 1'b1;
        #10;
        if (X !== 1'b1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        // Change A back to 0
        A = 1'b0;
        #10;
        if (X !== 1'b0) begin
            $display("FAIL: Output X should be 0 when A is 0");
            $finish;
        end

        // Change A to 1 again
        A = 1'b1;
        #10;
        if (X !== 1'b1) begin
            $display("FAIL: Output X should be 1 when A is 1");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule