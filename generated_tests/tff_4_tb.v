`timescale 1ns/1ps

module tb_tff;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the toggle flip-flop
    tff uut (
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
        // Initialize signals
        rst = 1; t = 0;
        #10; // Wait for 10ns

        // Check reset condition
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset condition failed");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test toggle functionality
        t = 1; // Set T to 1
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Toggle failed on T=1");
            $finish;
        end

        // Toggle again
        #10; // Wait for 10ns
        t = 0; // Set T to 0
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Toggle failed on T=0");
            $finish;
        end

        // Toggle again
        #10; // Wait for 10ns
        t = 1; // Set T to 1
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Toggle failed on T=1");
            $finish;
        end

        // Final toggle
        #10; // Wait for 10ns
        t = 0; // Set T to 0
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Toggle failed on T=0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule