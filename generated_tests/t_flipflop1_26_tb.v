`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
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
        rst = 1;
        t = 0;
        #10; // Wait for a clock cycle
        rst = 0; // Release reset

        // Test case 1: Check reset functionality
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Toggle q when t is high
        t = 1; // Enable toggle
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not toggle to 1 when t is high");
            $finish;
        end

        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not toggle to 0 on next clock edge");
            $finish;
        end

        // Test case 3: Check toggle with t low
        t = 0; // Disable toggle
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: q should remain 0 when t is low");
            $finish;
        end

        // Test case 4: Check toggle with t high again
        t = 1; // Enable toggle
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not toggle to 1 when t is high again");
            $finish;
        end

        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not toggle to 0 on next clock edge again");
            $finish;
        end

        // Test case 5: Assert reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule