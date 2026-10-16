`timescale 1ns/1ps

module tb_t_ff;

    reg clk;
    reg rst;
    reg T;
    wire Q;
    wire Q_bar;

    // Instantiate the module under test (uut)
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
        rst = 0;

        // Test case 1: T = 0, Q should remain 0
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T=0 and rst=0");
            $finish;
        end

        // Test case 2: T = 1, toggle Q
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T=1");
            $finish;
        end

        // Test case 3: T = 1, toggle Q again
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again with T=1");
            $finish;
        end

        // Test case 4: T = 0, Q should remain 0
        T = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when T=0");
            $finish;
        end

        // Test case 5: T = 1, toggle Q
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T=1");
            $finish;
        end

        // Test case 6: Reset the flip-flop
        rst = 1;
        #10;
        rst = 0;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule