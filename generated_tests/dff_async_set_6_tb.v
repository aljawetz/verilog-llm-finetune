`timescale 1ns/1ps

module tb_dff_async_set;

    reg clk;
    reg async_set;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    dff_async_set uut (
        .clk(clk),
        .async_set(async_set),
        .d(d),
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
        async_set = 0;
        d = 0;

        // Wait for a clock edge
        @(posedge clk);
        
        // Test 1: Check normal operation without async_set
        d = 1; // Set D to 1
        @(posedge clk);
        if (q !== 1) begin
            $display("FAIL: Expected q = 1, got q = %b", q);
            $finish;
        end

        // Test 2: Check async_set functionality
        async_set = 1; // Assert async_set
        @(posedge clk);
        if (q !== 1) begin
            $display("FAIL: Expected q = 1 after async_set, got q = %b", q);
            $finish;
        end

        // Test 3: Release async_set and check D input
        async_set = 0; // Deassert async_set
        d = 0; // Set D to 0
        @(posedge clk);
        if (q !== 0) begin
            $display("FAIL: Expected q = 0 after D = 0, got q = %b", q);
            $finish;
        end

        // Test 4: Change D input while clock is low
        d = 1; // Set D to 1
        @(posedge clk);
        if (q !== 1) begin
            $display("FAIL: Expected q = 1 after D = 1, got q = %b", q);
            $finish;
        end

        // Test 5: Assert async_set again
        async_set = 1; // Assert async_set
        @(posedge clk);
        if (q !== 1) begin
            $display("FAIL: Expected q = 1 after async_set, got q = %b", q);
            $finish;
        end

        // Test 6: Deassert async_set and check D input
        async_set = 0; // Deassert async_set
        d = 0; // Set D to 0
        @(posedge clk);
        if (q !== 0) begin
            $display("FAIL: Expected q = 0 after D = 0, got q = %b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule