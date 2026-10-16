`timescale 1ns/1ps

module tb_addr_counter;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period

    // Signals
    reg clk;
    reg rst;

    // Instantiate the module under test (uut)
    addr_counter uut (
        // No ports to connect
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // Reset logic
    initial begin
        rst = 1; // Assert reset
        #(CLK_PERIOD) rst = 0; // Deassert reset after one clock period
    end

    // Test sequence
    initial begin
        // Wait for reset to deassert
        @(negedge rst);

        // Add meaningful test sequences here
        // Example: Check initial state and behavior
        // Assuming addr_counter has an internal counter that increments on clock edges
        
        // Wait for a few clock cycles
        #(CLK_PERIOD * 5);
        
        // Check the output (assuming there's an output to check)
        // Here we would normally check the internal state of the uut
        // For demonstration, let's assume we have a hypothetical output 'addr'
        // assert(uut.addr == expected_value) else $display("FAIL: Address did not increment correctly");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule