`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
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
        rst_n = 0;
        d = 0;

        // Apply reset
        #10;
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset");
            $finish;
        end

        // Release reset
        rst_n = 1;
        #10;

        // Test case 1: Set d to 1 and check q
        d = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is 1");
            $finish;
        end

        // Test case 2: Set d to 0 and check q
        d = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: q should be 0 when d is 0");
            $finish;
        end

        // Test case 3: Check q follows d
        d = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: q should be 1 when d is 1");
            $finish;
        end

        // Test case 4: Assert reset works
        rst_n = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule