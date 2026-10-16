`timescale 1ns/1ps

module tb_T_flipflop;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the T_flipflop module
    T_flipflop uut (
        .t(t),
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
        t = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Toggle Q when t is high
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 2: Retain Q when t is low
        t = 0; // Set t low
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 3: Toggle Q again when t is high
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 4: Reset Q to 0
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // Test case 5: Toggle Q after reset
        reset = 0; // Release reset
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1 after reset and t=1, got Q=%b", Q);
            $finish;
        end

        // Test case 6: Retain Q when t is low
        t = 0; // Set t low
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 7: Toggle Q again
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule