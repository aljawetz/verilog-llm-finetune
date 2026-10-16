`timescale 1ns/1ps

module tb_D_flipflop;

    reg clk;
    reg rst;
    reg D;
    wire q;
    wire q_bar;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .rst(rst),
        .D(D),
        .q(q),
        .q_bar(q_bar)
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
        D = 0;

        // Apply reset
        #10;
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset not functioning correctly");
            $finish;
        end

        // Release reset
        rst = 0;

        // Test case 1: D = 0
        #10;
        D = 0;
        #10;
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: D = 0 not functioning correctly");
            $finish;
        end

        // Test case 2: D = 1
        #10;
        D = 1;
        #10;
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: D = 1 not functioning correctly");
            $finish;
        end

        // Test case 3: Check for clock edge
        #10;
        D = 0;
        #10;
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: D = 0 after clock edge not functioning correctly");
            $finish;
        end

        // Test case 4: Check reset functionality again
        #10;
        rst = 1; // Assert reset
        #10;
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset not functioning correctly after D = 1");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule