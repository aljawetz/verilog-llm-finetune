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
        // Initialize
        rst = 1; // Start with reset not asserted
        t = 0;   // T input low
        #10;     // Wait for 10ns

        // Test reset functionality
        rst = 0; // Assert reset
        #10;     // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        rst = 1; // Deassert reset
        #10;     // Wait for 10ns

        // Test toggling behavior with T = 1
        t = 1;   // Set T high
        #10;     // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q to be 1 after toggle");
            $finish;
        end

        #10;     // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0 after toggle");
            $finish;
        end

        // Test holding behavior with T = 0
        t = 0;   // Set T low
        #10;     // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to remain 0 when T is low");
            $finish;
        end

        #10;     // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to remain 0 when T is low");
            $finish;
        end

        // Test toggling again with T = 1
        t = 1;   // Set T high
        #10;     // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q to be 1 after toggle");
            $finish;
        end

        #10;     // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to be 0 after toggle");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule