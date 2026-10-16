`timescale 1ns/1ps

module tb_JK_flipflop;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the JK_flipflop module
    JK_flipflop uut (
        .j(j),
        .k(k),
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
        // Initialize inputs
        j = 0; k = 0; reset = 0;

        // Test 1: Asynchronous reset
        reset = 1; #10; // Assert reset
        reset = 0; #10; // Deassert reset
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not clear Q");
            $finish;
        end

        // Test 2: J=0, K=0 (hold state)
        j = 0; k = 0; #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Hold state failed");
            $finish;
        end

        // Test 3: J=0, K=1 (reset Q)
        j = 0; k = 1; #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not reset to 0");
            $finish;
        end

        // Test 4: J=1, K=0 (set Q)
        j = 1; k = 0; #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not set to 1");
            $finish;
        end

        // Test 5: J=1, K=1 (toggle Q)
        j = 1; k = 1; #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not toggle to 0");
            $finish;
        end

        // Toggle again
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle to 1");
            $finish;
        end

        // Test 6: J=0, K=0 (hold state again)
        j = 0; k = 0; #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Hold state failed after toggle");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule