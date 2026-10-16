`timescale 1ns/1ps

module tb_generator;

    reg clk;
    reg reset;
    wire signal;

    // Instantiate the module under test (uut)
    generator uut (
        .clk(clk),
        .reset(reset),
        .signal(signal)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Wait for the counter to reach 4 (signal should be high)
        #40; // Wait for 40ns (4 clock cycles)

        // Check if signal is high
        if (signal !== 1) begin
            $display("FAIL: Signal should be high after 4 clock cycles");
            $finish;
        end

        // Wait for another clock cycle to reset the counter
        #10;

        // Check if signal is low after reset
        if (signal !== 0) begin
            $display("FAIL: Signal should be low after reset");
            $finish;
        end

        // Wait for the counter to reach 4 again
        #40; // Wait for another 4 clock cycles

        // Check if signal is high again
        if (signal !== 1) begin
            $display("FAIL: Signal should be high after another 4 clock cycles");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule