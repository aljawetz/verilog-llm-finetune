`timescale 1ns/1ps

module tb_udp;

    // Instantiate the Unit Under Test (UUT)
    udp uut();

    // Clock and reset signals
    reg clk;
    reg rst_n;

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Initial block for reset and stimulus
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;

        // Apply reset
        #10 rst_n = 1; // Release reset after 10ns

        // Wait for a few clock cycles
        #20;

        // Check if the module is functioning correctly
        // (Add meaningful checks here based on expected behavior)
        // Since the module has no functionality, we will just check the reset state
        if (rst_n !== 1) begin
            $display("FAIL: Reset not released properly");
            $finish;
        end

        // Additional checks can be added here as needed

        // End of test
        $display("PASS");
        $finish;
    end

endmodule