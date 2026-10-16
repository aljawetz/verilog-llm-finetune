`timescale 1ns/1ps

module tb_jk_flip_flop;

    reg reset;
    reg clk;
    reg j;
    reg k;
    wire q;

    // Instantiate the module under test (uut)
    jk_flip_flop uut (
        .reset(reset),
        .clk(clk),
        .j(j),
        .k(k),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        j = 0;
        k = 0;
        #10;

        // Test reset functionality
        reset = 0; // Assert reset
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear output.");
            $finish;
        end

        reset = 1; // Deassert reset
        #10;

        // Test J = 1, K = 0 (Set)
        j = 1; k = 0;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: J=1, K=0 did not set output.");
            $finish;
        end

        // Test J = 0, K = 1 (Reset)
        j = 0; k = 1;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: J=0, K=1 did not reset output.");
            $finish;
        end

        // Test J = 1, K = 1 (Toggle)
        j = 1; k = 1;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: J=1, K=1 did not toggle output.");
            $finish;
        end

        // Toggle again
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: J=1, K=1 did not toggle output again.");
            $finish;
        end

        // Test J = 0, K = 0 (Hold)
        j = 0; k = 0;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: J=0, K=0 did not hold output.");
            $finish;
        end

        // Final toggle test
        j = 1; k = 1;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: J=1, K=1 did not toggle output to 1.");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule