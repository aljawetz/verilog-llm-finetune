`timescale 1ns/1ps

module tb_tff;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the T flip-flop
    tff uut (
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
            $display("FAIL: Expected Q=1 after toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 2: No toggle when t is low
        t = 0; // Set t low
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1 after no toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 3: Toggle Q again when t is high
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 4: Reset Q to 0
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // Test case 5: Release reset and toggle
        reset = 0; // Release reset
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1 after toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 6: No toggle when t is low
        t = 0; // Set t low
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Expected Q=1 after no toggle, got Q=%b", Q);
            $finish;
        end

        // Test case 7: Toggle Q again when t is high
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Expected Q=0 after toggle, got Q=%b", Q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule