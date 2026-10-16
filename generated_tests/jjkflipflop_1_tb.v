`timescale 1ns/1ps

module tb_jjkflipflop;
    reg clk;
    reg rst;
    reg [1:0] jk;
    wire q;
    wire qbar;

    // Instantiate the jjkflipflop module
    jjkflipflop uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst(rst),
        .jk(jk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1; // Assert reset
        jk = 2'b00; // Don't care
        #10; // Wait for a clock cycle
        rst = 0; // Deassert reset

        // Test case 1: JK = 00 (no change)
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 2: JK = 01 (reset)
        jk = 2'b01;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 3: JK = 10 (set)
        jk = 2'b10;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 4: JK = 11 (toggle)
        jk = 2'b11;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Final check for toggle
        jk = 2'b11;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule