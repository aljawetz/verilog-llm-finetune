`timescale 1ns/1ps

module tb_freq_div;

    reg clk;
    reg rst;
    wire clk_out;

    // Instantiate the module under test (uut)
    freq_div uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 0;
        #10; // Hold reset for 10ns
        rst = 1;

        // Wait for a few clock cycles to observe clk_out
        #100;

        // Check the output clock frequency
        // Expected clk_out frequency is clk frequency / div = 100MHz / 10 = 10MHz
        // It should toggle every 50ns (half of 100ns period)
        
        // Check the first toggle
        #50;
        if (clk_out !== 1) begin
            $display("FAIL: clk_out did not toggle as expected at 50ns");
            $finish;
        end

        // Check the second toggle
        #50;
        if (clk_out !== 0) begin
            $display("FAIL: clk_out did not toggle as expected at 100ns");
            $finish;
        end

        // Check the third toggle
        #50;
        if (clk_out !== 1) begin
            $display("FAIL: clk_out did not toggle as expected at 150ns");
            $finish;
        end

        // Check the fourth toggle
        #50;
        if (clk_out !== 0) begin
            $display("FAIL: clk_out did not toggle as expected at 200ns");
            $finish;
        end

        // Check the fifth toggle
        #50;
        if (clk_out !== 1) begin
            $display("FAIL: clk_out did not toggle as expected at 250ns");
            $finish;
        end

        // Check the sixth toggle
        #50;
        if (clk_out !== 0) begin
            $display("FAIL: clk_out did not toggle as expected at 300ns");
            $finish;
        end

        // Assert that the counter resets correctly
        rst = 0; // Assert reset
        #10;
        rst = 1; // Deassert reset
        #100; // Wait for some clock cycles

        // Check that clk_out is still toggling correctly
        #50;
        if (clk_out !== 1) begin
            $display("FAIL: clk_out did not toggle after reset at 50ns");
            $finish;
        end

        #50;
        if (clk_out !== 0) begin
            $display("FAIL: clk_out did not toggle after reset at 100ns");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule