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
        rst = 1;
        #10;
        rst = 0;
    end

    // Test sequence
    initial begin
        // Wait for a few clock cycles
        #20;

        // Check the output
        if (zero !== 1'b0) begin
            $display("FAIL: Output is not zero");
            $finish;
        end

        // Wait for more time and check again
        #20;
        if (zero !== 1'b0) begin
            $display("FAIL: Output is not zero after some time");
            $finish;
        end

        // Final check
        #10;
        if (zero !== 1'b0) begin
            $display("FAIL: Output is not zero at the end");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule