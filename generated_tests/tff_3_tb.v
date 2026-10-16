`timescale 1ns/1ps

module tb_tff;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the T flip-flop
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

        // Test reset functionality
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test T flip-flop behavior
        t = 1; // Set T to 1
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 after T=1");
            $finish;
        end

        // Toggle T
        t = 0; 
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 after T=0");
            $finish;
        end

        // Toggle T again
        t = 1; 
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Expected q=0, qbar=1 after T=1");
            $finish;
        end

        // Test reset again
        rst = 1; 
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule