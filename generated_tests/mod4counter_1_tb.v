`timescale 1ns/1ps

module tb_mod4counter;

    reg clk;
    reg reset;
    wire [1:0] count;

    // Instantiate the mod4counter
    mod4counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
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
        #10; // Wait for 10ns
        reset = 0;
        
        // Test counting
        if (count !== 2'd0) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end
        
        // Wait for 4 clock cycles and check the count
        #10; // 1st clock cycle
        if (count !== 2'd1) begin
            $display("FAIL: Count after 1 clock cycle is not 1");
            $finish;
        end
        
        #10; // 2nd clock cycle
        if (count !== 2'd2) begin
            $display("FAIL: Count after 2 clock cycles is not 2");
            $finish;
        end
        
        #10; // 3rd clock cycle
        if (count !== 2'd3) begin
            $display("FAIL: Count after 3 clock cycles is not 3");
            $finish;
        end
        
        #10; // 4th clock cycle
        if (count !== 2'd0) begin
            $display("FAIL: Count after 4 clock cycles is not 0");
            $finish;
        end
        
        // Test reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        reset = 0;
        
        if (count !== 2'd0) begin
            $display("FAIL: Count after reset is not zero");
            $finish;
        end
        
        // Test counting again after reset
        #10; // 1st clock cycle
        if (count !== 2'd1) begin
            $display("FAIL: Count after 1 clock cycle post-reset is not 1");
            $finish;
        end
        
        #10; // 2nd clock cycle
        if (count !== 2'd2) begin
            $display("FAIL: Count after 2 clock cycles post-reset is not 2");
            $finish;
        end
        
        #10; // 3rd clock cycle
        if (count !== 2'd3) begin
            $display("FAIL: Count after 3 clock cycles post-reset is not 3");
            $finish;
        end
        
        #10; // 4th clock cycle
        if (count !== 2'd0) begin
            $display("FAIL: Count after 4 clock cycles post-reset is not 0");
            $finish;
        end
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule