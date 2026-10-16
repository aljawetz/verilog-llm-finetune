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
        rst = 1; // Start with reset active
        t = 0;
        #10; // Wait for a clock cycle

        // Release reset
        rst = 0;
        #10; // Wait for a clock cycle

        // Test case 1: Toggle with T=1
        t = 1; 
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 2: Toggle with T=0 (should stay the same)
        t = 0; 
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 3: Toggle with T=1 again
        t = 1; 
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 4: Reset the flip-flop
        rst = 1; 
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after reset, got q=%b", q);
            $finish;
        end

        // Test case 5: Check toggle after reset
        rst = 0; 
        t = 1; 
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 6: Final toggle with T=0
        t = 0; 
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule