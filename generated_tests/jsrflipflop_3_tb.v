`timescale 1ns/1ps

module tb_jsrflipflop;
    reg clk;
    reg rst;
    reg [1:0] sr;
    wire q;
    wire qbar;

    // Instantiate the jsrflipflop module
    jsrflipflop uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst(rst),
        .sr(sr)
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
        sr = 2'b00;
        #10; // Wait for a clock cycle

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Hold state
        sr = 2'b00; // Should keep q unchanged
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 2: Set to 0
        sr = 2'b01; // Should set q to 0
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 3: Set to 1
        sr = 2'b10; // Should set q to 1
        #10;
        if (q !== 1) begin
            $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 4: Set to X
        sr = 2'b11; // Should set q to X
        #10;
        if (q !== 1'bx) begin
            $display("FAIL: Test case 4 failed, expected q=X, got q=%b", q);
            $finish;
        end

        // Test case 5: Reset
        rst = 1; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Test case 5 failed, expected q=0 after reset, got q=%b", q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule