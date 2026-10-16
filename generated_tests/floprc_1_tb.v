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
        rst = 0;
        clear = 0;
        d = 8'hAA; // Arbitrary test data

        // Test 1: Check reset functionality
        rst = 1; #10; // Assert reset
        if (q !== 8'b00000000) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end
        rst = 0; #10; // Deassert reset

        // Test 2: Check data capture
        d = 8'h55; #10; // Change data
        if (q !== 8'h55) begin
            $display("FAIL: Output did not capture input data");
            $finish;
        end

        // Test 3: Check clear functionality
        clear = 1; #10; // Assert clear
        if (q !== 8'b00000000) begin
            $display("FAIL: Clear did not clear output");
            $finish;
        end
        clear = 0; #10; // Deassert clear

        // Test 4: Check data capture after clear
        d = 8'hFF; #10; // Change data
        if (q !== 8'hFF) begin
            $display("FAIL: Output did not capture input data after clear");
            $finish;
        end

        // Test 5: Check reset during data capture
        d = 8'h12; #10; // Change data
        rst = 1; #10; // Assert reset
        if (q !== 8'b00000000) begin
            $display("FAIL: Reset during data capture did not clear output");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule