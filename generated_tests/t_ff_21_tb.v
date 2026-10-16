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
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test case 1: T = 0, Q should remain 0
        T = 0;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0 after reset");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when T is 1");
            $finish;
        end

        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should toggle to 0");
            $finish;
        end

        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should toggle to 1");
            $finish;
        end

        // Test case 3: Assert reset
        rst = 1;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 4: T = 1 again after reset
        rst = 0;
        T = 1;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after reset and T is 1");
            $finish;
        end

        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q should toggle to 0");
            $finish;
        end

        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q should toggle to 1");
            $finish;
        end

        // Final check for Q_bar
        if (Q_bar !== ~Q) begin
            $display("FAIL: Q_bar should be the complement of Q");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule