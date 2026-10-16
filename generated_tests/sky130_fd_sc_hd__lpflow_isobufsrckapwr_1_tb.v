`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_isobufsrckapwr;

    // Testbench signals
    reg SLEEP;
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__lpflow_isobufsrckapwr uut (
        .X(X),
        .SLEEP(SLEEP),
        .A(A)
    );

    initial begin
        // Initialize inputs
        SLEEP = 1;
        A = 0;

        // Test case 1: SLEEP = 1, A = 0 -> X should be 0
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 2: SLEEP = 1, A = 1 -> X should be 0
        A = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 3: SLEEP = 0, A = 0 -> X should be 0
        SLEEP = 0;
        A = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 4: SLEEP = 0, A = 1 -> X should be 1
        A = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed. Expected X = 1, got X = %b", X);
            $finish;
        end

        // Test case 5: SLEEP = 1, A = 0 -> X should be 0 (repeat to check stability)
        SLEEP = 1;
        A = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 5 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 6: SLEEP = 1, A = 1 -> X should be 0 (repeat to check stability)
        A = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 6 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule