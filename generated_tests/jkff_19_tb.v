`timescale 1ns/1ps

module tb_jkff;

    reg clk;
    reg reset;
    reg j;
    reg k;
    wire q;

    // Instantiate the module under test (uut)
    jkff uut (
        .clk(clk),
        .reset(reset),
        .j(j),
        .k(k),
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
        reset = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test case 1: J=0, K=0 (hold state)
        j = 0; k = 0;
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 2: J=0, K=1 (reset)
        j = 0; k = 1;
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 3: J=1, K=0 (set)
        j = 1; k = 0;
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 4: J=1, K=1 (toggle)
        j = 1; k = 1;
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
            $finish;
        end

        // Toggle again
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Test case 4 failed, expected q=1, got q=%b", q);
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule