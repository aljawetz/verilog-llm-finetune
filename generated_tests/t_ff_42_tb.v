`timescale 1ns/1ps

module tb_t_ff;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the module under test (uut)
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
            $display("FAIL: Initial state of q is not 0");
            $finish;
        end

        // Toggle T flip-flop
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: After first clock, q is not 1");
            $finish;
        end

        #10; // Wait for second clock cycle
        if (q !== 0) begin
            $display("FAIL: After second clock, q is not 0");
            $finish;
        end

        #10; // Wait for third clock cycle
        if (q !== 1) begin
            $display("FAIL: After third clock, q is not 1");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: After reset, q is not 0");
            $finish;
        end

        reset = 0;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: After reset and first clock, q is not 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule