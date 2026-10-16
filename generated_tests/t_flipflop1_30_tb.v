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

    // Test procedure
    initial begin
        // Initialize signals
        rst = 1; // Start with reset not asserted
        t = 0;   // T input

        // Test 1: Reset functionality
        rst = 0; // Assert reset
        #10;     // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: T = 0, should hold the value
        rst = 1; // Deassert reset
        #10;     // Wait for a clock edge
        t = 0;   // Set T to 0
        #10;     // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q should remain 0 when T is 0");
            $finish;
        end

        // Test 3: T = 1, should toggle
        t = 1;   // Set T to 1
        #10;     // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q should toggle to 1 when T is 1");
            $finish;
        end

        // Test 4: T = 0, should hold the value
        t = 0;   // Set T to 0
        #10;     // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q should remain 1 when T is 0");
            $finish;
        end

        // Test 5: T = 1, should toggle again
        t = 1;   // Set T to 1
        #10;     // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q should toggle to 0 when T is 1");
            $finish;
        end

        // Test 6: Assert reset again
        rst = 0; // Assert reset
        #10;     // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule