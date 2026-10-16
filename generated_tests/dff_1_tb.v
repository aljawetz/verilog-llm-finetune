`timescale 1ns/1ps

module tb_dff;

    // Testbench signals
    reg clk;
    reg rst;
    reg d;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    dff uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst(rst),
        .d(d)
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
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check output after setting d = 1
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 2: Check output after setting d = 0
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 3: Check asynchronous reset
        rst = 1;
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: Expected q = 0 after reset, got q = %b", q);
            $finish;
        end

        // Test case 4: Check qbar output
        rst = 0;
        d = 1;
        #10; // Wait for one clock cycle
        if (qbar !== 0) begin
            $display("FAIL: Expected qbar = 0, got qbar = %b", qbar);
            $finish;
        end

        // Test case 5: Check qbar output after setting d = 0
        d = 0;
        #10; // Wait for one clock cycle
        if (qbar !== 1) begin
            $display("FAIL: Expected qbar = 1, got qbar = %b", qbar);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule