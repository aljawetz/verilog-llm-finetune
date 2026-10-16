`timescale 1ns/1ps

module tb_shift_reg;
    parameter SIZE = 4;
    reg clk;
    reg rstn;
    reg SI;
    reg [1:0] S;
    reg [SIZE-1:0] PI;
    wire [SIZE-1:0] out;

    // Instantiate the shift register module
    shift_reg #(SIZE) uut (
        .clk(clk),
        .rstn(rstn),
        .SI(SI),
        .S(S),
        .PI(PI),
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
        rstn = 0;
        SI = 0;
        S = 2'b00;
        PI = 4'b0000;

        // Apply reset
        #10;
        rstn = 1; // Release reset

        // Test NO_CHANGE
        S = 2'b00; // No change
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Expected out = 0000, got out = %b", out);
            $finish;
        end

        // Test PARALLEL_LOAD
        PI = 4'b1010; // Load 1010
        S = 2'b11; // Parallel load
        #10;
        if (out !== 4'b1010) begin
            $display("FAIL: Expected out = 1010, got out = %b", out);
            $finish;
        end

        // Test SHIFT_LEFT
        S = 2'b10; // Shift left
        SI = 1; // Serial input
        #10;
        if (out !== 4'b0101) begin
            $display("FAIL: Expected out = 0101, got out = %b", out);
            $finish;
        end

        // Test SHIFT_RIGHT
        S = 2'b01; // Shift right
        #10;
        if (out !== 4'b1010) begin
            $display("FAIL: Expected out = 1010, got out = %b", out);
            $finish;
        end

        // Test NO_CHANGE again
        S = 2'b00; // No change
        #10;
        if (out !== 4'b1010) begin
            $display("FAIL: Expected out = 1010, got out = %b", out);
            $finish;
        end

        // Test reset functionality
        rstn = 0; // Assert reset
        #10;
        if (out !== 4'b0000) begin
            $display("FAIL: Expected out = 0000 after reset, got out = %b", out);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule