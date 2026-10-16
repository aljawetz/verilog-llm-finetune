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
        reset = 0;

        // Check initial count value
        if (count !== 3'b000) begin
            $display("FAIL: Initial count is not 0");
            $finish;
        end

        // Count up to 6
        repeat (7) begin
            #10; // Wait for one clock cycle
        end

        // Check count value after 7 counts
        if (count !== 3'b000) begin
            $display("FAIL: Count did not reset after reaching 7");
            $finish;
        end

        // Count again to ensure it cycles correctly
        repeat (7) begin
            #10; // Wait for one clock cycle
        end

        // Check count value after another 7 counts
        if (count !== 3'b000) begin
            $display("FAIL: Count did not reset after second cycle");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule