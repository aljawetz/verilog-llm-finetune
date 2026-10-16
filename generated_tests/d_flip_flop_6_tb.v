`timescale 1ns/1ps

module tb_d_flip_flop;

    reg d;
    reg clk;
    reg reset;
    wire q;
    wire q_bar;

    // Instantiate the D flip-flop
    d_flip_flop uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        d = 0;
        #10; // Wait for 10ns
        
        // Check reset functionality
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1");
            $finish;
        end
        
        // Release reset
        reset = 0;
        #10; // Wait for 10ns
        
        // Test setting d to 1
        d = 1;
        #10; // Wait for 10ns
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: After setting d to 1, q should be 1 and q_bar should be 0");
            $finish;
        end
        
        // Test setting d to 0
        d = 0;
        #10; // Wait for 10ns
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: After setting d to 0, q should be 0 and q_bar should be 1");
            $finish;
        end
        
        // Test reset functionality again
        reset = 1;
        #10; // Wait for 10ns
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and q_bar to 1 again");
            $finish;
        end
        
        // End simulation
        $display("PASS");
        $finish;
    end

endmodule