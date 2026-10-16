`timescale 1ns/1ps

module tb_dff_async_set;

    reg clk;
    reg async_set;
    reg d;
    wire q;

    // Instantiate the D flip-flop with async set
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
        // Initialize signals
        async_set = 0;
        d = 0;

        // Wait for a few clock cycles
        #10;

        // Test 1: Check normal operation without async_set
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test 1 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test 2: Check async_set functionality
        async_set = 1; // Activate async_set
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test 2 failed, expected q=1 after async_set, got q=%b", q);
            $finish;
        end

        // Test 3: Deactivate async_set and check D input
        async_set = 0; // Deactivate async_set
        d = 0; // Change D to 0
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Test 3 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test 4: Check D input again
        d = 1; // Change D to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test 4 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test 5: Check async_set again
        async_set = 1; // Activate async_set
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Test 5 failed, expected q=1 after async_set, got q=%b", q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule