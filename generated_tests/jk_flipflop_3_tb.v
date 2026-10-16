`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j, k, clk, reset;
    wire q;

    // Instantiate the JK flip-flop
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

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Hold state (j=0, k=0)
        j = 0; k = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 2: Clear state (j=0, k=1)
        j = 0; k = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // Toggle again
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 5: Asynchronous reset
        reset = 1;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after reset, got q=%b", q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule