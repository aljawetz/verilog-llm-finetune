`timescale 1ns/1ps

module tb_tff;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the toggle flip-flop
    tff uut (
        .t(t),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        t = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Toggle when t is high
        t = 1;
        #10; // Wait for 1 clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1 after toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 2: Toggle again
        #10; // Wait for 1 clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 3: Hold state when t is low
        t = 0;
        #10; // Wait for 1 clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 when t=0, got Q=%b", Q);
            $finish;
        end

        // Test case 4: Toggle again with t high
        t = 1;
        #10; // Wait for 1 clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1 after toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 5: Reset functionality
        reset = 1;
        #10; // Wait for 1 clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // Test case 6: Ensure it holds state after reset
        reset = 0;
        t = 1;
        #10; // Wait for 1 clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1 after toggle, got Q=%b", Q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule