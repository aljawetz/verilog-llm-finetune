`timescale 1ns/1ps

module tb_t_ff;

    reg clk;
    reg rst;
    reg T;
    wire Q;
    wire Q_bar;

    // Instantiate the T flip-flop
    t_ff uut (
        .clk(clk),
        .rst(rst),
        .T(T),
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
        rst = 1;
        T = 0;

        // Apply reset
        #10;
        rst = 0; // Release reset

        // Test case 1: T = 0, Q should remain 0
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0 after reset");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again with T = 1");
            $finish;
        end

        // Test case 3: T = 0, Q should remain the same
        T = 0;
        #10; // Wait for one clock cycle
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when T is 0");
            $finish;
        end

        // Test case 4: Assert Q_bar is always the complement of Q
        if (Q_bar !== ~Q) begin
            $display("FAIL: Q_bar should be the complement of Q");
            $finish;
        end

        // Test case 5: Reset functionality
        rst = 1; // Assert reset
        #10;
        rst = 0; // Release reset
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Final check for Q_bar
        if (Q_bar !== ~Q) begin
            $display("FAIL: Q_bar should be the complement of Q after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule