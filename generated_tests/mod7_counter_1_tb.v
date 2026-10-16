`timescale 1ns/1ps

module tb_mod7_counter;

    reg clk;
    reg reset;
    wire [2:0] count;

    // Instantiate the module under test (uut)
    mod7_counter uut (
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

        // Test counting from 0 to 6
        if (count !== 3'b000) begin
            $display("FAIL: Initial count is not 0");
            $finish;
        end
        
        // Wait for 7 clock cycles to test mod-7 behavior
        #70; // 7 clock cycles (70ns)

        if (count !== 3'b000) begin
            $display("FAIL: Count did not reset to 0 after reaching 6");
            $finish;
        end

        // Test reset functionality
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Check if count is 0 after reset
        if (count !== 3'b000) begin
            $display("FAIL: Count is not 0 after reset");
            $finish;
        end

        // Continue counting and check values
        #70; // Wait for 7 clock cycles

        if (count !== 3'b000) begin
            $display("FAIL: Count did not reset to 0 after reaching 6 again");
            $finish;
        end

        // Final check to ensure everything passed
        $display("PASS");
        $finish;
    end

endmodule