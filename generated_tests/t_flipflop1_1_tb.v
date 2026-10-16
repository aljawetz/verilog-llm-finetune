`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; t = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: T = 0, Q should remain 0
        t = 0;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle to 1
        t = 1;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: T = 0, Q should remain 1
        t = 0;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle to 0
        t = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset functionality failed");
            $finish;
        end

        // Test case 6: T = 1 after reset, Q should toggle to 1
        rst = 0; t = 1;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule