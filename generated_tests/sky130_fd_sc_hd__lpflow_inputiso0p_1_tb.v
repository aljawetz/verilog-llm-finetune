`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_inputiso0p;

    // Testbench signals
    reg A;
    reg SLEEP;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__lpflow_inputiso0p uut (
        .X(X),
        .A(A),
        .SLEEP(SLEEP)
    );

    initial begin
        // Initialize inputs
        A = 0;
        SLEEP = 0;

        // Test case 1: SLEEP = 0, A = 0 -> X should be 0
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 2: SLEEP = 0, A = 1 -> X should be 1
        A = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 2 failed. Expected X = 1, got X = %b", X);
            $finish;
        end

        // Test case 3: SLEEP = 1, A = 0 -> X should be 0
        SLEEP = 1;
        A = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 4: SLEEP = 1, A = 1 -> X should be 0
        A = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 4 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 5: SLEEP = 0, A = 0 -> X should be 0 (retesting)
        SLEEP = 0;
        A = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 5 failed. Expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 6: SLEEP = 0, A = 1 -> X should be 1 (retesting)
        A = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 6 failed. Expected X = 1, got X = %b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule