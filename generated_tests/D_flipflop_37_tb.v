`timescale 1ns/1ps

module tb_D_flipflop;

    reg d;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0;
        reset = 0;

        // Test 1: Reset functionality
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        
        reset = 0; // Deactivate reset
        #10; // Wait for one clock cycle

        // Test 2: Check D flip-flop behavior
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1");
            $finish;
        end
        
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when d is 0");
            $finish;
        end
        
        // Test 3: Check reset during operation
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset during operation");
            $finish;
        end
        
        reset = 0; // Deactivate reset
        #10; // Wait for one clock cycle
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when d is 1 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule