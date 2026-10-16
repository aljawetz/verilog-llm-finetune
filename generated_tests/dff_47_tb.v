`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .clk(clk),
        .reset(reset),
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
        reset = 1;
        d = 0;

        // Apply reset
        #10;
        reset = 0;

        // Test case 1: Check output after setting d
        d = 1; 
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1, got q=%b", q);
            $finish;
        end

        // Test case 2: Check output after clearing d
        d = 0; 
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0, got q=%b", q);
            $finish;
        end

        // Test case 3: Check reset functionality
        reset = 1; 
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after reset, got q=%b", q);
            $finish;
        end

        // Test case 4: Check output after reset is released
        reset = 0; 
        d = 1; 
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after reset released, got q=%b", q);
            $finish;
        end

        // Test case 5: Check output after another reset
        reset = 1; 
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after second reset, got q=%b", q);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule