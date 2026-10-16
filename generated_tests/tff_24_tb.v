`timescale 1ns/1ps

module tb_tff;

    reg t;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
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

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Toggle Q when t is high
        t = 1; // Set T to toggle
        #10;   // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to be 1 after toggle, got %b", Q);
            $finish;
        end

        // Test case 2: No toggle when t is low
        t = 0; // Set T to not toggle
        #10;   // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to remain 1, got %b", Q);
            $finish;
        end

        // Test case 3: Toggle Q again
        t = 1; // Set T to toggle
        #10;   // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Expected Q to be 0 after toggle, got %b", Q);
            $finish;
        end

        // Test case 4: Reset the flip-flop
        reset = 1; // Apply reset
        #10;       // Wait for one clock cycle
        reset = 0; // Release reset
        if (Q !== 1'b0) begin
            $display("FAIL: Expected Q to be 0 after reset, got %b", Q);
            $finish;
        end

        // Test case 5: Toggle Q again
        t = 1; // Set T to toggle
        #10;   // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to be 1 after toggle, got %b", Q);
            $finish;
        end

        // Test case 6: No toggle when t is low
        t = 0; // Set T to not toggle
        #10;   // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to remain 1, got %b", Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule