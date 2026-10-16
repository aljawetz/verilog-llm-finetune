`timescale 1ns/1ps

module tb_jk_ff;

    reg j, k, clk, reset;
    wire Q, Q_bar;

    // Instantiate the JK flip-flop
    jk_ff uut (
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
        reset = 1; j = 0; k = 0;
        #10; // Wait for clock edge
        reset = 0;

        // Test case 1: Reset
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Reset did not set Q to 0 and Q_bar to 1");
            $finish;
        end

        // Test case 2: J=0, K=0 (no change)
        j = 0; k = 0;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Q and Q_bar did not remain unchanged");
            $finish;
        end

        // Test case 3: J=0, K=1 (reset)
        j = 0; k = 1;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Q did not reset to 0 and Q_bar to 1");
            $finish;
        end

        // Test case 4: J=1, K=0 (set)
        j = 1; k = 0;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Q did not set to 1 and Q_bar to 0");
            $finish;
        end

        // Test case 5: J=1, K=1 (toggle)
        j = 1; k = 1;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Q did not toggle to 0 and Q_bar to 1");
            $finish;
        end

        // Test case 6: J=0, K=0 (no change)
        j = 0; k = 0;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Q and Q_bar did not remain unchanged");
            $finish;
        end

        // Test case 7: J=1, K=0 (set again)
        j = 1; k = 0;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Q did not set to 1 and Q_bar to 0");
            $finish;
        end

        // Test case 8: J=0, K=1 (reset again)
        j = 0; k = 1;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Q did not reset to 0 and Q_bar to 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule