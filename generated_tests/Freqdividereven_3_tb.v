`timescale 1ns/1ps

module tb_Freqdividereven;

    reg clk;
    reg rstN;
    wire out_clk;

    // Instantiate the module under test
    Freqdividereven uut (
        .clk(clk),
        .rstN(rstN),
        .out_clk(out_clk)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rstN = 0; // Active low reset
        #10; // Wait for 10ns
        rstN = 1; // Release reset

        // Wait for a few clock cycles
        #20;

        // Check the output clock signal
        if (out_clk !== 0) begin
            $display("FAIL: out_clk should be 0 after reset and during counting");
            $finish;
        end

        // Wait for more clock cycles
        #20;

        // Check the output clock signal again
        if (out_clk !== 0) begin
            $display("FAIL: out_clk should still be 0");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule