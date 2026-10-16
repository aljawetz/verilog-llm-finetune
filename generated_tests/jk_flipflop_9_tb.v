`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j, k, clk, reset;
    wire q;

    // Instantiate the JK Flip-Flop
    jk_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .reset(reset),
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
        reset = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        reset = 0;

        // Test case 1: j = 0, k = 0 (q should remain unchanged)
        #10; 
        if (q !== 0) begin
            $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 2: j = 0, k = 1 (q should be reset to 0)
        j = 0; k = 1;
        #10; 
        if (q !== 0) begin
            $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 3: j = 1, k = 0 (q should be set to 1)
        j = 1; k = 0;
        #10; 
        if (q !== 1) begin
            $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 4: j = 1, k = 1 (q should toggle)
        j = 1; k = 1;
        #10; 
        if (q !== 0) begin
            $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
            $finish;
        end

        #10; 
        if (q !== 1) begin
            $display("FAIL: Test case 4 failed on second toggle, expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 5: Reset the flip-flop
        reset = 1;
        #10; 
        reset = 0;

        // Check if q is reset to 0
        if (q !== 0) begin
            $display("FAIL: Test case 5 failed, expected q=0 after reset, got q=%b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule