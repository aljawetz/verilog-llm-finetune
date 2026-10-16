`timescale 1ns/1ps

module tb_t_ff;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the toggle flip-flop
    t_ff uut (
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
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0; // Release reset
        
        // Test toggle functionality
        if (q !== 0) begin
            $display("FAIL: Initial output should be 0 after reset");
            $finish;
        end
        
        // Wait for first clock edge
        #10;
        if (q !== 1) begin
            $display("FAIL: Output should be 1 after first toggle");
            $finish;
        end
        
        // Wait for second clock edge
        #10;
        if (q !== 0) begin
            $display("FAIL: Output should be 0 after second toggle");
            $finish;
        end
        
        // Wait for third clock edge
        #10;
        if (q !== 1) begin
            $display("FAIL: Output should be 1 after third toggle");
            $finish;
        end
        
        // Assert reset again
        reset = 1;
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end
        
        // Release reset and toggle again
        reset = 0;
        #10;
        if (q !== 1) begin
            $display("FAIL: Output should be 1 after toggle post-reset");
            $finish;
        end
        
        // Final check
        #10;
        if (q !== 0) begin
            $display("FAIL: Output should be 0 after final toggle");
            $finish;
        end
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule