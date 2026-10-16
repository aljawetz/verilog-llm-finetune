`timescale 1ns/1ps

module tb_moore_machine_non_overlapping;
    reg data;
    reg clk;
    reg rst;
    wire op;

    // Instantiate the module under test (uut)
    moore_machine_non_overlapping uut (
        .data(data),
        .clk(clk),
        .rst(rst),
        .op(op)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        data = 0;

        // Apply reset
        #10;
        rst = 1; // Release reset
        #10;

        // Test sequence to detect "1001"
        // Expected output: op should go high after "1001" is detected
        // Sequence: 1, 0, 0, 1 -> op should be high after this sequence
        #10 data = 1; // State s0 -> s1
        #10 data = 0; // State s1 -> s2
        #10 data = 0; // State s2 -> s3
        #10 data = 1; // State s3 -> s4, op should be high
        #10 if (op !== 1'b1) begin
            $display("FAIL: Expected op to be 1 after detecting '1001'");
            $finish;
        end

        // Reset the machine
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Release reset

        // Test with a sequence that does not contain "1001"
        // Sequence: 1, 0, 1, 0 -> op should remain low
        #10 data = 1; // State s0 -> s1
        #10 data = 0; // State s1 -> s2
        #10 data = 1; // State s2 -> s1
        #10 data = 0; // State s1 -> s2
        #10 if (op !== 1'b0) begin
            $display("FAIL: Expected op to be 0 for non-matching sequence");
            $finish;
        end

        // Test with another sequence that contains "1001"
        // Sequence: 0, 1, 0, 0, 1 -> op should go high after "1001"
        #10 data = 0; // State s0
        #10 data = 1; // State s0 -> s1
        #10 data = 0; // State s1 -> s2
        #10 data = 0; // State s2 -> s3
        #10 data = 1; // State s3 -> s4, op should be high
        #10 if (op !== 1'b1) begin
            $display("FAIL: Expected op to be 1 after detecting '1001'");
            $finish;
        end

        // Final reset and check
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Release reset

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule