`timescale 1ns/1ps

module tb_T_flfp;

    reg T;
    reg clk;
    reg reset;
    wire Q;
    wire Qb;

    // Instantiate the T flip-flop
    T_flfp uut (
        .T(T),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qb(Qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        T = 0;

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: T = 0, Q should remain 0
        #10;
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1 || Qb !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: T = 1, Q should toggle again
        #10;
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: T = 0, Q should remain 0
        T = 0;
        #10;
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Assert reset, Q should be 0
        reset = 1;
        #10;
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Release reset, T = 1, Q should toggle
        reset = 0;
        T = 1;
        #10;
        if (Q !== 1 || Qb !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: T = 1, Q should toggle again
        #10;
        if (Q !== 0 || Qb !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule