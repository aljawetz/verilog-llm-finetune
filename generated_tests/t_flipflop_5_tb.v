`timescale 1ns/1ps

module tb_t_flipflop;

    reg clk;
    reg reset;
    reg T;
    wire Q;

    // Instantiate the T flip-flop
    t_flipflop uut (
        .clk(clk),
        .reset(reset),
        .T(T),
        .Q(Q)
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
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: T = 0, Q should remain unchanged
        T = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1, got Q = %b", Q);
            $finish;
        end

        // Test case 3: T = 1, Q should toggle again
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 4: T = 0, Q should remain unchanged
        T = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0, got Q = %b", Q);
            $finish;
        end

        // Test case 5: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Expected Q = 1, got Q = %b", Q);
            $finish;
        end

        // Test case 6: Asynchronous reset
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Expected Q = 0 after reset, got Q = %b", Q);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule