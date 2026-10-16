`timescale 1ns/1ps

module tb_t_ff;

    reg t;
    reg rst_n;
    reg clk;
    wire q;

    // Instantiate the T flip-flop
    t_ff uut (
        .t(t),
        .rst_n(rst_n),
        .clk(clk),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        t = 0;
        rst_n = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset
        #10;

        // Test case 1: Toggle when t is high
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after toggle, got q=%b", q);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after toggle, got q=%b", q);
            $finish;
        end

        // Test case 2: No toggle when t is low
        t = 0; // Set t low
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0 with t=0, got q=%b", q);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0 with t=0, got q=%b", q);
            $finish;
        end

        // Test case 3: Reset functionality
        rst_n = 0; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after reset, got q=%b", q);
            $finish;
        end

        rst_n = 1; // Release reset
        #10;

        // Test case 4: Toggle after reset
        t = 1; // Set t high
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after toggle, got q=%b", q);
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after toggle, got q=%b", q);
            $finish;
        end

        // Finalize the simulation
        $display("PASS");
        $finish;
    end

endmodule