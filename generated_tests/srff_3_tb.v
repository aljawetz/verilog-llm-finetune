`timescale 1ns/1ps

module tb_srff;

    reg s;
    reg r;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the SR flip-flop
    srff uut (
        .s(s),
        .r(r),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; s = 0; r = 0;
        #10; // Wait for a clock cycle

        // Test reset condition
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset condition failed");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for a clock cycle

        // Test hold condition
        s = 0; r = 0;
        #10; // Wait for a clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Hold condition failed");
            $finish;
        end

        // Test set condition
        s = 1; r = 0;
        #10; // Wait for a clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Set condition failed");
            $finish;
        end

        // Test reset condition
        s = 0; r = 1;
        #10; // Wait for a clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset condition failed");
            $finish;
        end

        // Test invalid condition (s = 1, r = 1)
        s = 1; r = 1;
        #10; // Wait for a clock cycle
        if (q !== 1'bx || qbar !== 1'bx) begin
            $display("FAIL: Invalid condition failed");
            $finish;
        end

        // Final state check
        s = 0; r = 0;
        #10; // Wait for a clock cycle
        if (q !== 1'bx || qbar !== 1'bx) begin
            $display("FAIL: Final state check failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule