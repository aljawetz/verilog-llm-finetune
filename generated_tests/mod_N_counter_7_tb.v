`timescale 1ns/1ps

module tb_mod_N_counter;

    reg clk;
    reg reset;
    wire [2:0] counter;

    // Instantiate the module under test (uut)
    mod_N_counter #(6, 3) uut (
        .clk(clk),
        .reset(reset),
        .counter(counter)
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

        // Check initial value of counter
        if (counter !== 3'b000) begin
            $display("FAIL: Initial counter value is not zero");
            $finish;
        end

        // Count up to N-1
        repeat (6) begin
            #10; // Wait for clock edge
        end

        // Check counter value after reaching N-1
        if (counter !== 3'b000) begin
            $display("FAIL: Counter did not reset after reaching N-1");
            $finish;
        end

        // Count again to N-1
        repeat (6) begin
            #10; // Wait for clock edge
        end

        // Check counter value after reaching N-1 again
        if (counter !== 3'b000) begin
            $display("FAIL: Counter did not reset after reaching N-1 on second cycle");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for clock edge
        reset = 0;

        // Check counter value after reset
        if (counter !== 3'b000) begin
            $display("FAIL: Counter value is not zero after reset");
            $finish;
        end

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule