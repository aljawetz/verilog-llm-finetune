`timescale 1ns/1ps

module tb_ticker;

    // Testbench signals
    reg clk;
    reg reset;
    wire tick;

    // Instantiate the module under test (uut)
    ticker uut (
        .clk(clk),
        .reset(reset),
        .tick(tick)
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

        // Check initial state
        if (uut.count !== 20'b0) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end

        // Simulate clock cycles
        repeat (1000000) @(posedge clk); // Wait for 1 million clock cycles

        // Check if tick is high after reaching 999999
        if (uut.tick !== 1) begin
            $display("FAIL: Tick did not go high at count 999999");
            $finish;
        end

        // Reset the counter
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check if count is reset to zero
        if (uut.count !== 20'b0) begin
            $display("FAIL: Count is not zero after reset");
            $finish;
        end

        // Simulate clock cycles until tick goes high again
        repeat (1000000) @(posedge clk); // Wait for another million clock cycles

        // Check if tick is high again after reaching 999999
        if (uut.tick !== 1) begin
            $display("FAIL: Tick did not go high at count 999999 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule