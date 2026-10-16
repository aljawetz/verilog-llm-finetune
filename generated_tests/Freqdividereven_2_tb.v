`timescale 1ns/1ps

module tb_Freqdividereven;

    reg clk;
    reg rstN;
    wire out_clk;

    // Instantiate the module under test (uut)
    Freqdividereven uut (
        .clk(clk),
        .rstN(rstN),
        .out_clk(out_clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize reset
        rstN = 0; // Assert reset
        #10;
        rstN = 1; // Deassert reset
        #20;

        // Check the output clock signal
        if (out_clk !== 0) begin
            $display("FAIL: out_clk should be 0 after reset");
            $finish;
        end

        // Wait for a few clock cycles
        #50;

        // Check the output clock signal again
        if (out_clk !== 0) begin
            $display("FAIL: out_clk should still be 0");
            $finish;
        end

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule