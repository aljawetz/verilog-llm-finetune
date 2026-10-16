`timescale 1ns/1ps

module tb_dff;
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
        rst = 1; // Start with reset active
        d = 0;

        // Wait for a clock edge
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Test setting d = 1
        d = 1;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Output after setting d=1 is incorrect");
            $finish;
        end

        // Test setting d = 0
        d = 0;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Output after setting d=0 is incorrect");
            $finish;
        end

        // Test reset functionality
        rst = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Output after reset is incorrect");
            $finish;
        end

        // Release reset and test again
        rst = 0;
        d = 1;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Output after setting d=1 post-reset is incorrect");
            $finish;
        end

        // Final check
        d = 0;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Final output after setting d=0 is incorrect");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule