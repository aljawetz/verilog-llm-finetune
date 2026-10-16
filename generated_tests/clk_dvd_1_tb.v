`timescale 1ns/1ps

module tb_clk_dvd;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    clk_dvd uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 1;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Check initial state after reset
        if (q !== 0) begin
            $display("FAIL: Initial output q should be 0 after reset");
            $finish;
        end

        // Wait for one clock cycle
        #10;
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 after first clock cycle");
            $finish;
        end

        // Wait for another clock cycle
        #10;
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 after second clock cycle");
            $finish;
        end

        // Wait for another clock cycle
        #10;
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 after third clock cycle");
            $finish;
        end

        // Assert that the output toggles correctly for a few cycles
        #10;
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 after fourth clock cycle");
            $finish;
        end

        #10;
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 after fifth clock cycle");
            $finish;
        end

        // Test reset functionality again
        rst = 1; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Output q should be 0 after reset");
            $finish;
        end

        rst = 0; // Release reset
        #10;
        if (q !== 1) begin
            $display("FAIL: Output q should be 1 after releasing reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule