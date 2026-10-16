`timescale 1ns/1ps

module tb_universal_shift_register;
    reg clk;
    reg rst;
    reg sin;
    reg [1:0] mode;
    reg [3:0] data_in;
    wire [3:0] out;

    // Instantiate the unit under test (UUT)
    universal_shift_register uut (
        .clk(clk),
        .rst(rst),
        .sin(sin),
        .mode(mode),
        .data_in(data_in),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Reset the UUT
        rst = 1;
        #10;
        rst = 0;

        // Test Hold Mode
        mode = 2'b00;
        data_in = 4'b1010; // Initial data
        #10;
        if (out !== 4'b0000) $display("FAIL: Output should be 0000 after reset");

        // Test Load Mode
        mode = 2'b11;
        data_in = 4'b1010;
        #10;
        if (out !== 4'b1010) $display("FAIL: Output should be 1010 after loading");

        // Test Shift Left Mode
        mode = 2'b01;
        sin = 1'b1; // Input for shifting
        #10;
        if (out !== 4'b1101) $display("FAIL: Output should be 1101 after shifting left");

        // Test Shift Right Mode
        mode = 2'b10;
        sin = 1'b0; // Input for shifting
        #10;
        if (out !== 4'b0110) $display("FAIL: Output should be 0110 after shifting right");

        // Test Load Mode again
        mode = 2'b11;
        data_in = 4'b1111;
        #10;
        if (out !== 4'b1111) $display("FAIL: Output should be 1111 after loading");

        // Test Hold Mode again
        mode = 2'b00;
        #10;
        if (out !== 4'b1111) $display("FAIL: Output should still be 1111 in hold mode");

        $display("PASS");
        $finish;
    end
endmodule