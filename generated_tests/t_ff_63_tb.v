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
        #10;

        // Release reset
        rst = 0;
        #10;

        // Test case 1: T = 0, Q should remain the same
        T = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0 and rst is released");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1");
            $finish;
        end

        // Test case 3: T = 0, Q should remain the same
        T = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T is 0");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle again
        T = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling with T = 1");
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be reset to 0 when rst is asserted");
            $finish;
        end

        // Test case 6: T = 1 after reset, Q should toggle
        rst = 0;
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1 post reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule