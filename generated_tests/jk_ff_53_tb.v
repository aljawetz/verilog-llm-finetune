`timescale 1ns/1ps

module tb_jk_ff;
    reg j, k, clk, reset;
    wire Q, Q_bar;

    // Instantiate the jk_ff module
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
        // Initialize inputs
        j = 0; k = 0; reset = 1; // Assert reset
        #10 reset = 0; // Deassert reset

        // Test case 1: Hold state (j=0, k=0)
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Test case 1 failed (Hold state)");
            $finish;
        end

        // Test case 2: Reset state (j=0, k=0, reset=1)
        #10 reset = 1; // Assert reset
        #10 reset = 0; // Deassert reset
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Test case 2 failed (Reset state)");
            $finish;
        end

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Test case 3 failed (Set state)");
            $finish;
        end

        // Test case 4: Reset state (j=0, k=1)
        j = 0; k = 1;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Test case 4 failed (Reset state)");
            $finish;
        end

        // Test case 5: Toggle state (j=1, k=1)
        j = 1; k = 1;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Test case 5 failed (Toggle state)");
            $finish;
        end

        // Test case 6: Toggle state again (j=1, k=1)
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Test case 6 failed (Toggle state)");
            $finish;
        end

        // Test case 7: Hold state (j=0, k=0)
        j = 0; k = 0;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Test case 7 failed (Hold state)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule