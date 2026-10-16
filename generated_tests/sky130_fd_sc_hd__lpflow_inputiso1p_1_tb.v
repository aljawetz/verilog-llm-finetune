`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__lpflow_inputiso1p;

    // Inputs
    reg A;
    reg SLEEP;

    // Outputs
    wire X;

    // Instantiate the Unit Under Test (UUT)
    sky130_fd_sc_hd__lpflow_inputiso1p uut (
        .X(X),
        .A(A),
        .SLEEP(SLEEP)
    );

    initial begin
        // Initialize Inputs
        A = 0;
        SLEEP = 0;

        // Test case 1: A = 0, SLEEP = 0
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 1 failed (A=0, SLEEP=0)");
            $finish;
        end

        // Test case 2: A = 0, SLEEP = 1
        SLEEP = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 2 failed (A=0, SLEEP=1)");
            $finish;
        end

        // Test case 3: A = 1, SLEEP = 0
        A = 1;
        SLEEP = 0;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 3 failed (A=1, SLEEP=0)");
            $finish;
        end

        // Test case 4: A = 1, SLEEP = 1
        SLEEP = 1;
        #10;
        if (X !== 1) begin
            $display("FAIL: Test case 4 failed (A=1, SLEEP=1)");
            $finish;
        end

        // Test case 5: A = 0, SLEEP = 0 (repeat to check stability)
        A = 0;
        SLEEP = 0;
        #10;
        if (X !== 0) begin
            $display("FAIL: Test case 5 failed (A=0, SLEEP=0)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule