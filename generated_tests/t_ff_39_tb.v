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
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Initial state incorrect after reset");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Q did not toggle as expected");
            $finish;
        end

        // Test case 3: T = 0, Q should remain the same
        T = 0;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Q changed when T is 0");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle again
        T = 1;
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Q did not toggle as expected");
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1; // Assert reset
        #10;
        if (Q !== 0 || Q_bar !== 1) begin
            $display("FAIL: Q did not reset to 0");
            $finish;
        end

        // Test case 6: T = 1 after reset, Q should toggle
        rst = 0; // Release reset
        T = 1;
        #10;
        if (Q !== 1 || Q_bar !== 0) begin
            $display("FAIL: Q did not toggle after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule