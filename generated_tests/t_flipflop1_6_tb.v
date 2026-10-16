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
        rst = 1; t = 0;
        #10; // Wait for a clock edge
        rst = 0; // Release reset

        // Test case 1: T = 0, Q should remain the same
        t = 0; #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Expected Q=0 when T=0 and Q was initially 0");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1; #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: Expected Q=1 when T=1 and Q was initially 0");
            $finish;
        end

        // Test case 3: T = 0, Q should remain the same
        t = 0; #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: Expected Q=1 when T=0 and Q was 1");
            $finish;
        end

        // Test case 4: T = 1, Q should toggle
        t = 1; #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Expected Q=0 when T=1 and Q was 1");
            $finish;
        end

        // Test case 5: Assert reset functionality
        rst = 1; #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Expected Q=0 after reset");
            $finish;
        end

        // Test case 6: T = 1 after reset, Q should toggle
        rst = 0; t = 1; #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: Expected Q=1 when T=1 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule