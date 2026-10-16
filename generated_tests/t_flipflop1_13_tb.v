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
        // Initialize inputs
        rst = 1; t = 0;
        #10; // Wait for a clock cycle

        // Release reset
        rst = 0;
        #10; // Wait for a clock cycle

        // Test case 1: T = 0, expect Q to remain the same
        t = 0; 
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", q);
            $finish;
        end

        // Test case 2: T = 1, expect Q to toggle
        t = 1; 
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", q);
            $finish;
        end

        // Test case 3: T = 0, expect Q to remain the same
        t = 0; 
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected Q=1, got Q=%b", q);
            $finish;
        end

        // Test case 4: T = 1, expect Q to toggle
        t = 1; 
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected Q=0, got Q=%b", q);
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1; 
        #10; // Wait for a clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Expected Q=0, Qbar=1 after reset, got Q=%b, Qbar=%b", q, qbar);
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule