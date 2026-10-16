`timescale 1ns/1ps

module tb_dff;
    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D Flip-Flop
    dff uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d = 0;
        rst = 0;

        // Test reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end

        rst = 0; // Deassert reset
        #10; // Wait for one clock cycle

        // Test D flip-flop functionality
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: Output did not follow D input");
            $finish;
        end

        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Output did not follow D input");
            $finish;
        end

        d = 1; // Set D to 1 again
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: Output did not follow D input");
            $finish;
        end

        // Final reset test
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule