`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_isobufsrc;

    // Testbench signals
    reg SLEEP;
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__lpflow_isobufsrc uut (
        .X(X),
        .SLEEP(SLEEP),
        .A(A)
    );

    initial begin
        // Initialize inputs
        SLEEP = 1'b1;
        A = 1'b0;

        // Wait for a short time
        #10;

        // Test case 1: SLEEP = 1, A = 0 -> X should be 0
        if (X !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 2: SLEEP = 1, A = 1 -> X should be 0
        A = 1'b1;
        #10;
        if (X !== 1'b0) begin
            $display("FAIL: Test case 2 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 3: SLEEP = 0, A = 0 -> X should be 0
        SLEEP = 1'b0;
        A = 1'b0;
        #10;
        if (X !== 1'b0) begin
            $display("FAIL: Test case 3 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 4: SLEEP = 0, A = 1 -> X should be 1
        A = 1'b1;
        #10;
        if (X !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected X = 1, got X = %b", X);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule