`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg reset;
    reg d;
    wire Q;

    // Instantiate the D flip-flop
    dff uut (
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

        // Test D input capture
        d = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after D is set to 1");
            $finish;
        end

        // Change D input
        d = 0;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after D is set to 0");
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