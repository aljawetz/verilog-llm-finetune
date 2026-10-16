`timescale 1ns/1ps

module tb_t_ff;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the T flip-flop module
    t_ff uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        t = 0;
        rst = 1;

        // Apply reset
        #10;
        rst = 0; // Release reset

        // Test case 1: T = 0, q should remain 0
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 1 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 2: T = 1, q should toggle
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Test case 2 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 3: T = 1, q should toggle again
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 3 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 4: T = 0, q should remain 0
        t = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 5: Assert reset, q should be 0
        rst = 1;
        #10;
        rst = 0; // Release reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 5 failed, expected q = 0 after reset, got q = %b", q);
            $finish;
        end

        // Test case 6: T = 1, q should toggle
        t = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Test case 6 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 7: T = 1, q should toggle again
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 7 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule