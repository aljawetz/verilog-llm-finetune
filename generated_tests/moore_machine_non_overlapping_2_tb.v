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
        data = 1; #10; // Input: 1
        data = 0; #10; // Input: 0
        data = 0; #10; // Input: 0
        data = 1; #10; // Input: 1
        if (op !== 1'b1) begin
            $display("FAIL: Expected op=1 after detecting '1001', got op=%b", op);
            $finish;
        end

        // Reset the machine
        rst = 0; #10;
        rst = 1; #10;

        // Test sequence without detection
        data = 1; #10; // Input: 1
        data = 0; #10; // Input: 0
        data = 1; #10; // Input: 1
        data = 0; #10; // Input: 0
        if (op !== 1'b0) begin
            $display("FAIL: Expected op=0, got op=%b", op);
            $finish;
        end

        // Test sequence to detect "1001" again
        data = 1; #10; // Input: 1
        data = 0; #10; // Input: 0
        data = 0; #10; // Input: 0
        data = 1; #10; // Input: 1
        if (op !== 1'b1) begin
            $display("FAIL: Expected op=1 after detecting '1001', got op=%b", op);
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule