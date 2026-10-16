`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the counter module
    counter uut (
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
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0; // Release reset
        
        // Check initial count value
        if (count !== 4'b0000) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end
        
        // Wait for a few clock cycles and check count
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count did not increment to 1");
            $finish;
        end
        
        #10; // Wait for another clock cycle
        if (count !== 4'b0010) begin
            $display("FAIL: Count did not increment to 2");
            $finish;
        end
        
        #10; // Wait for another clock cycle
        if (count !== 4'b0011) begin
            $display("FAIL: Count did not increment to 3");
            $finish;
        end
        
        #10; // Wait for another clock cycle
        if (count !== 4'b0100) begin
            $display("FAIL: Count did not increment to 4");
            $finish;
        end
        
        // Assert reset functionality
        reset = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not reset to zero");
            $finish;
        end
        
        reset = 0; // Release reset
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count did not increment to 1 after reset");
            $finish;
        end
        
        // Continue counting until wrap around
        repeat (15) begin
            #10; // Wait for clock cycle
        end
        
        // Check wrap around
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not wrap around to zero");
            $finish;
        end
        
        $display("PASS");
        $finish;
    end

endmodule