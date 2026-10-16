`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .d(d),
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
        // Initialize inputs
        d = 0;

        // Wait for the first clock edge
        #10;

        // Test case 1: Set d to 1
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 3: Change d to 1 again
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 4: Change d to 0 again
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 5: Hold d at 1
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test case 5 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 6: Hold d at 0
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule