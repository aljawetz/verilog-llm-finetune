`timescale 1ns/1ps

module tb_Moore_overlapping;

    reg din;
    reg clk;
    reg reset;
    wire dout;

    // Instantiate the module under test
    Moore_overlapping uut (
        .din(din),
        .clk(clk),
        .reset(reset),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        din = 0;
        reset = 1;

        // Apply reset
        #10 reset = 0;

        // Test sequence to check the state transitions and output
        // Sequence: 1, 0, 0, 1, 1 (should produce dout = 1 at the end)
        #10 din = 1; // State s0 -> s1
        #10 din = 0; // State s1 -> s2
        #10 din = 0; // State s2 -> s3
        #10 din = 1; // State s3 -> s4
        #10 din = 1; // State s4 -> s1, dout should be 1

        // Check dout
        if (dout !== 1'b1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // Reset and check another sequence
        #10 reset = 1; // Assert reset
        #10 reset = 0; // Deassert reset

        // New sequence: 1, 1, 0, 0, 1 (should produce dout = 1 at the end)
        #10 din = 1; // State s0 -> s1
        #10 din = 1; // State s1 -> s1
        #10 din = 0; // State s1 -> s2
        #10 din = 0; // State s2 -> s3
        #10 din = 1; // State s3 -> s4
        #10 din = 1; // State s4 -> s1, dout should be 1

        // Check dout
        if (dout !== 1'b1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // Reset and check another sequence
        #10 reset = 1; // Assert reset
        #10 reset = 0; // Deassert reset

        // Final sequence: 0, 1, 0, 1 (should produce dout = 0)
        #10 din = 0; // State s0 -> s0
        #10 din = 1; // State s0 -> s1
        #10 din = 0; // State s1 -> s2
        #10 din = 1; // State s2 -> s1, dout should be 0

        // Check dout
        if (dout !== 1'b0) begin
            $display("FAIL: Expected dout = 0, got dout = %b", dout);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule