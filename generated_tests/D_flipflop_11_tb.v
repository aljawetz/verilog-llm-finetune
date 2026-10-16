`timescale 1ns/1ps

module tb_D_flipflop;

    reg clk;
    reg reset;
    reg d;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
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
        reset = 1;
        d = 0;
        #10; // Wait for a clock edge
        
        // Test reset functionality
        reset = 0; // Deassert reset
        #10; // Wait for a clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        
        // Test D flip-flop functionality
        d = 1; // Set D to 1
        #10; // Wait for a clock edge
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end
        
        d = 0; // Set D to 0
        #10; // Wait for a clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end
        
        // Test reset functionality again
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end
        
        // Finalize the test
        $display("PASS");
        $finish;
    end

endmodule