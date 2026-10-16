`timescale 1ns/1ps

module tb_d_ff;
    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D Flip-Flop
    d_ff uut (
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
        // Initialize signals
        d = 0;
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        rst = 0; // Deassert reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check D input propagation
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d (expected 1)");
            $finish;
        end

        // Test case 3: Change D input
        d = 0; // Set D to 0
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: q did not follow d (expected 0)");
            $finish;
        end

        // Test case 4: Check multiple clock cycles
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d (expected 1)");
            $finish;
        end

        // Test case 5: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 6: Deassert reset and check D input
        rst = 0; // Deassert reset
        d = 1; // Set D to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d (expected 1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule