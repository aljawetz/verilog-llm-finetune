`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the jk_flipflop module
    jk_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qb(qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        j = 0; k = 0; rst = 1; 
        #10; // Wait for a clock cycle

        // Test reset functionality
        rst = 0; // Release reset
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qb to 1");
            $finish;
        end

        // Test J=0, K=0 (hold state)
        j = 0; k = 0;
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Hold state failed");
            $finish;
        end

        // Test J=0, K=1 (clear)
        j = 0; k = 1;
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Clear state failed");
            $finish;
        end

        // Test J=1, K=0 (set)
        j = 1; k = 0;
        #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Set state failed");
            $finish;
        end

        // Test J=1, K=1 (toggle)
        j = 1; k = 1;
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Toggle state failed on first toggle");
            $finish;
        end
        #10;
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Toggle state failed on second toggle");
            $finish;
        end

        // Final check
        rst = 1; // Assert reset
        #10;
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Final reset check failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule