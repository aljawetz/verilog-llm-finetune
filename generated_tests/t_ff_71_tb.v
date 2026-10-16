`timescale 1ns/1ps

module tb_t_ff;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the toggle flip-flop
    t_ff uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check initial state
        if (q !== 0) begin
            $display("FAIL: Initial state is not 0");
            $finish;
        end

        // Toggle the flip-flop
        #10; // Wait for a negative clock edge
        if (q !== 1) begin
            $display("FAIL: After first toggle, q is not 1");
            $finish;
        end

        #10; // Wait for a negative clock edge
        if (q !== 0) begin
            $display("FAIL: After second toggle, q is not 0");
            $finish;
        end

        #10; // Wait for a negative clock edge
        if (q !== 1) begin
            $display("FAIL: After third toggle, q is not 1");
            $finish;
        end

        // Assert reset
        reset = 1;
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: After reset, q is not 0");
            $finish;
        end

        // Release reset and toggle again
        reset = 0;
        #10; // Wait for a negative clock edge
        if (q !== 1) begin
            $display("FAIL: After toggle post-reset, q is not 1");
            $finish;
        end

        #10; // Wait for a negative clock edge
        if (q !== 0) begin
            $display("FAIL: After second toggle post-reset, q is not 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule