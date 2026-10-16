`timescale 1ns/1ps

module tb_tff;
    reg clk;
    reg t;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the T flip-flop
    tff uut (
        .clk(clk),
        .t(t),
        .rst(rst),
        .q(q),
        .qb(qb)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; t = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: T = 0, Q should remain the same
        t = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0 and rst is active");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1");
            $finish;
        end

        // Test case 3: T = 0, Q should remain the same
        t = 0;
        #10;
        if (q !== 1) begin
            $display("FAIL: Q should remain 1 when T is 0");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle
        t = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Q should be 0 after toggling with T = 1");
            $finish;
        end

        // Test case 5: Assert qb is the inverse of q
        if (qb !== 1) begin
            $display("FAIL: qb should be 1 when Q is 0");
            $finish;
        end

        // Test case 6: Reset the flip-flop
        rst = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 7: Release reset and toggle
        rst = 0;
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1");
            $finish;
        end

        // Test case 8: Final check of qb
        if (qb !== 0) begin
            $display("FAIL: qb should be 0 when Q is 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule