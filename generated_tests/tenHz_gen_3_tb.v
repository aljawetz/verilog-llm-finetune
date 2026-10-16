`timescale 1ns/1ps

module tb_tenHz_gen;

    reg clk_100MHz;
    reg reset;
    wire clk_10Hz;

    // Instantiate the module under test (uut)
    tenHz_gen uut (
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .clk_10Hz(clk_10Hz)
    );

    // Generate 100MHz clock
    initial begin
        clk_100MHz = 0;
        forever #5 clk_100MHz = ~clk_100MHz; // 100MHz clock period = 10ns
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #15; // Hold reset for a few clock cycles
        reset = 0;
        
        // Wait for a few cycles to observe clk_10Hz
        #100000000; // Wait for 10Hz output to toggle a few times (100M / 10 = 10M ns)

        // Check the output clk_10Hz
        if (clk_10Hz !== 1'b0) begin
            $display("FAIL: clk_10Hz should be 0 after reset");
            $finish;
        end

        // Wait for one full period of clk_10Hz (100M / 10 = 10M ns)
        #50000000; // Wait for 5 seconds (half period)
        if (clk_10Hz !== 1'b1) begin
            $display("FAIL: clk_10Hz should be 1 after half period");
            $finish;
        end

        #50000000; // Wait for another 5 seconds (another half period)
        if (clk_10Hz !== 1'b0) begin
            $display("FAIL: clk_10Hz should be 0 after full period");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Hold reset for a short time
        reset = 0;

        // Wait to observe clk_10Hz after reset
        #100000000; // Wait for 10Hz output to toggle a few times

        // Final check
        if (clk_10Hz !== 1'b0) begin
            $display("FAIL: clk_10Hz should be 0 after reset");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule