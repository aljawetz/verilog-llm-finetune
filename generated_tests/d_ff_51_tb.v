`timescale 1ns/1ps

module tb_d_ff;

    parameter Bitwidth = 8;
    reg [Bitwidth-1:0] in;
    reg clk;
    reg rst;
    wire [Bitwidth-1:0] out;

    // Instantiate the D flip-flop
    d_ff #(Bitwidth) uut (
        .in(in),
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Start with reset high
        in = 8'h00;
        #10; // Wait for a clock cycle

        // Check reset functionality
        if (out !== 8'h34) begin
            $display("FAIL: Reset did not set output to 8'h34");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for a clock cycle

        // Test input capture
        in = 8'hAB; // Set input to 8'hAB
        #10; // Wait for a clock cycle
        if (out !== 8'hAB) begin
            $display("FAIL: Output did not capture input 8'hAB");
            $finish;
        end

        // Test reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (out !== 8'h34) begin
            $display("FAIL: Reset did not set output to 8'h34");
            $finish;
        end

        // Release reset and test another input
        rst = 0;
        in = 8'hFF; // Set input to 8'hFF
        #10; // Wait for a clock cycle
        if (out !== 8'hFF) begin
            $display("FAIL: Output did not capture input 8'hFF");
            $finish;
        end

        // Final reset check
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (out !== 8'h34) begin
            $display("FAIL: Reset did not set output to 8'h34");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule