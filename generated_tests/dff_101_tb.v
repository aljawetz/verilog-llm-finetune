`timescale 1ns/1ps

module tb_dff;

    parameter WIDTH = 8;
    reg clk;
    reg rst;
    reg [WIDTH-1:0] d;
    wire [WIDTH-1:0] q;

    // Instantiate the D flip-flop
    dff #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
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
        d = 8'b00000000;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Check reset functionality
        d = 8'b10101010; // Input data
        #10; // Wait for one clock cycle
        if (q !== 8'b10101010) begin
            $display("FAIL: q should be 10101010 after clock with d = 10101010");
            $finish;
        end

        // Test case 2: Check reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 8'b00000000) begin
            $display("FAIL: q should be 00000000 after reset");
            $finish;
        end

        // Test case 3: Check normal operation after reset
        rst = 0; // Deassert reset
        d = 8'b11110000; // New input data
        #10; // Wait for one clock cycle
        if (q !== 8'b11110000) begin
            $display("FAIL: q should be 11110000 after clock with d = 11110000");
            $finish;
        end

        // Test case 4: Check another input
        d = 8'b00001111; // New input data
        #10; // Wait for one clock cycle
        if (q !== 8'b00001111) begin
            $display("FAIL: q should be 00001111 after clock with d = 00001111");
            $finish;
        end

        // Test case 5: Assert reset again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 8'b00000000) begin
            $display("FAIL: q should be 00000000 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule