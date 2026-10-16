`timescale 1ns/1ps

module tb_jk_ff1;

    reg j, k, clk, reset;
    wire Q, Q_bar;

    // Instantiate the module under test (uut)
    jk_ff1 uut (
        .j(j),
        .k(k),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        j = 0; k = 0; reset = 1;
        #10; // Wait for reset to take effect

        // Check reset condition
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and Q_bar to 1");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test hold state (j=0, k=0)
        j = 0; k = 0;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Hold state failed");
            $finish;
        end

        // Test reset to clear (j=0, k=1)
        j = 0; k = 1;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Clear state failed");
            $finish;
        end

        // Test set state (j=1, k=0)
        j = 1; k = 0;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Set state failed");
            $finish;
        end

        // Test toggle state (j=1, k=1)
        j = 1; k = 1;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Toggle state failed on first toggle");
            $finish;
        end

        // Toggle again
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Toggle state failed on second toggle");
            $finish;
        end

        // Final check for hold state
        j = 0; k = 0;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Hold state failed after toggle");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule