`timescale 1ns/1ps

module tb_t_ff;

    reg clk;
    reg rst;
    reg T;
    wire Q;
    wire Q_bar;

    // Instantiate the module under test
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
        #10;

        // Test case 1: T = 0, Q should remain 0
        T = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1");
            $finish;
        end

        // Test case 3: T = 1, Q should toggle again
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again with T = 1");
            $finish;
        end

        // Test case 4: Assert Q_bar
        if (Q_bar !== 1) begin
            $display("FAIL: Q_bar should be 1 when Q is 0");
            $finish;
        end

        // Test case 5: Reset the flip-flop
        rst = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        if (Q_bar !== 1) begin
            $display("FAIL: Q_bar should be 1 after reset");
            $finish;
        end

        // Test case 6: T = 1 after reset, Q should toggle
        rst = 0;
        T = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1");
            $finish;
        end

        // Test case 7: T = 0, Q should remain the same
        T = 0;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should remain 1 when T is 0");
            $finish;
        end

        // Test case 8: T = 1, Q should toggle
        T = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should toggle to 0 with T = 1");
            $finish;
        end

        // Final check for Q_bar
        if (Q_bar !== 1) begin
            $display("FAIL: Q_bar should be 1 when Q is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule