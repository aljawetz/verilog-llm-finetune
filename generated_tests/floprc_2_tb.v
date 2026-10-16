`timescale 1ns/1ps

module tb_floprc;

    parameter WIDTH = 8;
    reg clk;
    reg rst;
    reg clear;
    reg [WIDTH-1:0] d;
    wire [WIDTH-1:0] q;

    // Instantiate the module under test
    floprc #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .clear(clear),
        .d(d),
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
        rst = 1;
        clear = 0;
        d = 8'h00;

        // Wait for a clock edge
        #10;

        // Release reset
        rst = 0;

        // Test 1: Check reset functionality
        #10;
        if (q !== 8'h00) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end

        // Test 2: Load data
        d = 8'hA5; // Load data
        #10; // Wait for clock edge
        if (q !== 8'hA5) begin
            $display("FAIL: Output did not match input data after clock edge");
            $finish;
        end

        // Test 3: Clear functionality
        clear = 1; // Assert clear
        #10; // Wait for clock edge
        if (q !== 8'h00) begin
            $display("FAIL: Clear did not reset output to zero");
            $finish;
        end
        clear = 0; // Deassert clear

        // Test 4: Load new data after clear
        d = 8'h3C; // Load new data
        #10; // Wait for clock edge
        if (q !== 8'h3C) begin
            $display("FAIL: Output did not match new input data after clock edge");
            $finish;
        end

        // Test 5: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for clock edge
        if (q !== 8'h00) begin
            $display("FAIL: Reset did not clear output again");
            $finish;
        end

        // Test 6: Load data after reset
        rst = 0; // Deassert reset
        d = 8'hFF; // Load data
        #10; // Wait for clock edge
        if (q !== 8'hFF) begin
            $display("FAIL: Output did not match input data after clock edge post-reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule