`timescale 1ns/1ps

module tb_jk_to_t_flipflop;
    reg T;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
    jk_to_t_flipflop uut (
        .T(T),
        .clk(clk),
        .reset(reset),
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
        reset = 0;

        // Test case 1: Reset the flip-flop
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 2: Set T = 1, expect Q to toggle
        T = 1;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T=1");
            $finish;
        end

        // Test case 3: Toggle again
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again with T=1");
            $finish;
        end

        // Test case 4: Set T = 0, expect Q to hold
        T = 0;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 with T=0");
            $finish;
        end

        // Test case 5: Set T = 1, expect Q to toggle
        T = 1;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T=1");
            $finish;
        end

        // Test case 6: Reset again
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 7: Toggle with T = 1
        T = 1;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T=1");
            $finish;
        end

        // Test case 8: Toggle again
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again with T=1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule