`timescale 1ns/1ps

module tb_t_flipflop1;

    // Inputs
    reg t;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire qbar;

    // Instantiate the Unit Under Test (UUT)
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
        // Initialize inputs
        t = 0;
        rst = 1; // Assert reset
        #10; // Wait for 10ns

        // Deassert reset
        rst = 0;
        #10; // Wait for 10ns

        // Test case 1: Toggle with T=1
        t = 1;
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Toggle with T=0 (should hold state)
        t = 0;
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Toggle with T=1 again
        t = 1;
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Assert reset
        rst = 1;
        #10; // Wait for 10ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Deassert reset and toggle
        rst = 0;
        t = 1;
        #10; // Wait for 10ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule