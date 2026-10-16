`timescale 1ns/1ps

module tb_clock_divider;
    reg clk;
    reg rst;
    wire clk_out;

    // Instantiate the module under test (uut)
    clock_divider uut (
        .clk(clk),
        .clk_out(clk_out),
        .rst(rst)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period for clk
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 0;
        #10; // Wait for 10ns
        rst = 1; // Release reset

        // Wait for a few clock cycles and check clk_out
        #10;
        if (clk_out !== 1'b1) begin
            $display("FAIL: clk_out should be 1 after 10ns with rst high");
            $finish;
        end

        #10;
        if (clk_out !== 1'b0) begin
            $display("FAIL: clk_out should be 0 after 20ns with rst high");
            $finish;
        end

        #10;
        if (clk_out !== 1'b1) begin
            $display("FAIL: clk_out should be 1 after 30ns with rst high");
            $finish;
        end

        // Test reset functionality
        rst = 0; // Assert reset
        #10;
        if (clk_out !== 1'b0) begin
            $display("FAIL: clk_out should be 0 after reset is asserted");
            $finish;
        end

        // Release reset again
        rst = 1;
        #10;
        if (clk_out !== 1'b1) begin
            $display("FAIL: clk_out should be 1 after releasing reset");
            $finish;
        end

        // Final check
        #10;
        if (clk_out !== 1'b0) begin
            $display("FAIL: clk_out should be 0 after 50ns with rst high");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule