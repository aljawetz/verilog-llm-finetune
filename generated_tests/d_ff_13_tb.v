`timescale 1ns/1ps

module tb_d_ff;

    // Parameters
    reg clk;
    reg rst;
    reg d_in;
    wire q;
    wire q_bar;

    // Instantiate the D flip-flop
    d_ff uut (
        .clk(clk),
        .rst(rst),
        .d_in(d_in),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        d_in = 0;

        // Wait for a clock cycle
        #10;

        // Test reset functionality
        rst = 0; // Assert reset
        #10;
        if (q !== 1'b0 || q_bar !== 1'b1) begin
            $display("FAIL: Reset did not clear output correctly");
            $finish;
        end

        // Release reset
        rst = 1;
        #10;

        // Test D flip-flop functionality
        d_in = 1; // Set D input
        #10; // Wait for clock edge
        if (q !== 1'b1 || q_bar !== 1'b0) begin
            $display("FAIL: D flip-flop did not capture input correctly");
            $finish;
        end

        d_in = 0; // Change D input
        #10; // Wait for clock edge
        if (q !== 1'b0 || q_bar !== 1'b1) begin
            $display("FAIL: D flip-flop did not capture input correctly");
            $finish;
        end

        // Test reset again
        rst = 0; // Assert reset
        #10;
        if (q !== 1'b0 || q_bar !== 1'b1) begin
            $display("FAIL: Reset did not clear output correctly");
            $finish;
        end

        // Release reset and test again
        rst = 1;
        d_in = 1; // Set D input
        #10; // Wait for clock edge
        if (q !== 1'b1 || q_bar !== 1'b0) begin
            $display("FAIL: D flip-flop did not capture input correctly after reset");
            $finish;
        end

        // Final check
        d_in = 0; // Change D input
        #10; // Wait for clock edge
        if (q !== 1'b0 || q_bar !== 1'b1) begin
            $display("FAIL: D flip-flop did not capture input correctly after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule