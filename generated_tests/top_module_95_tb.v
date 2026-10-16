`timescale 1ns/1ps

module tb_top_module;

    // Instantiate the module under test
    wire zero;
    top_module uut (
        .zero(zero)
    );

    // Testbench signals
    reg clk;
    reg rst;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Reset generation
    initial begin
        rst = 1; // Assert reset
        #10;     // Hold reset for 10ns
        rst = 0; // Deassert reset
    end

    // Test sequence
    initial begin
        // Wait for reset to deassert
        @(negedge rst);
        
        // Check the output
        #10; // Wait for a short time to observe output
        if (zero !== 0) begin
            $display("FAIL: Output is not zero after reset");
            $finish;
        end

        // Additional checks
        #10; // Wait for another short time
        if (zero !== 0) begin
            $display("FAIL: Output is not zero during normal operation");
            $finish;
        end

        // Final check after some time
        #10; // Wait for another short time
        if (zero !== 0) begin
            $display("FAIL: Output is not zero after additional time");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule