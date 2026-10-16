`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_inputiso0n;

    // Testbench signals
    reg A;
    reg SLEEP_B;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__lpflow_inputiso0n uut (
        .X(X),
        .A(A),
        .SLEEP_B(SLEEP_B)
    );

    initial begin
        // Initialize inputs
        A = 0;
        SLEEP_B = 0;

        // Test case 1: SLEEP_B = 0, A = 0 -> X should be 0
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 2: SLEEP_B = 0, A = 1 -> X should be 0
        A = 1;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 2 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 3: SLEEP_B = 1, A = 0 -> X should be 0
        SLEEP_B = 1;
        A = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 3 failed, expected X = 0, got X = %b", X);
            $finish;
        end

        // Test case 4: SLEEP_B = 1, A = 1 -> X should be 1
        A = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed, expected X = 1, got X = %b", X);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule