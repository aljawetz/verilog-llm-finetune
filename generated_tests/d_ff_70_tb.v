`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg rst;
    wire q;
    wire qb;

    // Instantiate the D Flip-Flop
    d_ff uut (
        .q(q),
        .qb(qb),
        .d(d),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; // Assert reset
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check D input propagation
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Test case 1 failed, expected q=1, qb=0, got q=%b, qb=%b", q, qb);
            $finish;
        end

        // Test case 2: Check D input propagation with D=0
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Test case 2 failed, expected q=0, qb=1, got q=%b, qb=%b", q, qb);
            $finish;
        end

        // Test case 3: Check reset functionality
        rst = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Test case 3 failed, expected q=0, qb=1 after reset, got q=%b, qb=%b", q, qb);
            $finish;
        end

        // Test case 4: Check D input propagation after reset
        rst = 0; // Release reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1 || qb !== 0) begin
            $display("FAIL: Test case 4 failed, expected q=1, qb=0, got q=%b, qb=%b", q, qb);
            $finish;
        end

        // Test case 5: Check D input propagation with D=0 again
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (q !== 0 || qb !== 1) begin
            $display("FAIL: Test case 5 failed, expected q=0, qb=1, got q=%b, qb=%b", q, qb);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule