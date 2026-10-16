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
        rst = 1; D = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test 1: Check reset functionality
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1");
            $finish;
        end

        // Test 2: Check D input propagation
        D = 1; #10; // Wait for one clock cycle
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test 3: Check D input change
        D = 0; #10; // Wait for one clock cycle
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: D input change did not propagate correctly");
            $finish;
        end

        // Test 4: Check reset functionality again
        rst = 1; #10; // Wait for one clock cycle
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1 again");
            $finish;
        end

        // Test 5: Check D input after reset
        rst = 0; D = 1; #10; // Wait for one clock cycle
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: D input did not propagate correctly after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule