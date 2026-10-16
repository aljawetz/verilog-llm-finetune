`timescale 1ns/1ps

module tb_flop;

    // Inputs
    reg reset;
    reg clk;
    reg D;

    // Outputs
    wire Q;

    // Instantiate the Unit Under Test (UUT)
    flop uut (
        .reset(reset),
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        D = 0;

        // Wait for a clock edge
        #10;
        
        // Test reset functionality
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test D input functionality
        D = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // Change D input
        D = 0;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Test reset again
        reset = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule