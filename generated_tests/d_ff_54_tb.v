`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg rst;
    wire Q;

    // Instantiate the D flip-flop
    d_ff uut (
        .d(d),
        .clk(clk),
        .rst(rst),
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
        d = 0;
        rst = 0;

        // Test 1: Reset the flip-flop
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 2: Check D input when not reset
        rst = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // Test 3: Change D input
        d = 0; // Set D to 0
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 5: Check D input after reset
        rst = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule