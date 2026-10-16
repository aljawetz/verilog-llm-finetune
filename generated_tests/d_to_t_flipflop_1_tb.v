`timescale 1ns/1ps

module tb_d_to_t_flipflop;

    reg D;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
    d_to_t_flipflop uut (
        .D(D),
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
        D = 0;
        #10; // Wait for 10ns
        reset = 0;

        // Test case 1: Check reset functionality
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 2: Toggle Q when D changes
        D = 1; #10; // D = 1, expect Q to toggle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        D = 0; #10; // D = 0, expect Q to toggle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        D = 1; #10; // D = 1, expect Q to toggle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // Test case 3: Check asynchronous reset
        reset = 1; #10; // Assert reset
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 4: Check toggling behavior
        reset = 0; D = 1; #10; // D = 1, expect Q to toggle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        D = 0; #10; // D = 0, expect Q to toggle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        D = 1; #10; // D = 1, expect Q to toggle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // Final check
        reset = 1; #10; // Assert reset
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule