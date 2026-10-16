`timescale 1ns/1ps

module tb_reg_12bit;

    reg clk;
    reg rst;
    reg [11:0] in0;
    wire [11:0] out0;

    // Instantiate the module under test (uut)
    reg_12bit uut (
        .clk(clk),
        .rst(rst),
        .in0(in0),
        .out0(out0)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Start with reset
        in0 = 12'h000;

        // Wait for a clock cycle
        #10;

        // Check reset functionality
        if (out0 !== 12'h000) begin
            $display("FAIL: Reset did not set output to zero");
            $finish;
        end

        // Release reset
        rst = 0;
        in0 = 12'hABC; // Load some data

        // Wait for a clock cycle
        #10;

        // Check if output is loaded correctly
        if (out0 !== 12'hABC) begin
            $display("FAIL: Output did not match input after loading data");
            $finish;
        end

        // Change input data
        in0 = 12'h123;

        // Wait for a clock cycle
        #10;

        // Check if output is updated correctly
        if (out0 !== 12'h123) begin
            $display("FAIL: Output did not update with new input data");
            $finish;
        end

        // Assert reset again
        rst = 1;

        // Wait for a clock cycle
        #10;

        // Check reset functionality again
        if (out0 !== 12'h000) begin
            $display("FAIL: Reset did not set output to zero on second reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule