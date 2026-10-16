`timescale 1ns/1ps

module tb_siso_4bit;

    reg din;
    reg clk;
    reg rst;
    wire [3:0] dout;

    // Instantiate the module under test
    siso_4bit uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        din = 0;
        rst = 1;

        // Apply reset
        #10;
        rst = 0;

        // Test sequence
        // Shift in 4 bits: 1011
        din = 1; #10; // dout should be 0001
        din = 0; #10; // dout should be 0010
        din = 1; #10; // dout should be 0101
        din = 1; #10; // dout should be 1011

        // Check the output
        if (dout !== 4'b1011) begin
            $display("FAIL: Expected dout = 1011, got dout = %b", dout);
            $finish;
        end

        // Shift in 4 bits: 0000
        din = 0; #10; // dout should be 0111
        din = 0; #10; // dout should be 0011
        din = 0; #10; // dout should be 0001
        din = 0; #10; // dout should be 0000

        // Check the output
        if (dout !== 4'b0000) begin
            $display("FAIL: Expected dout = 0000, got dout = %b", dout);
            $finish;
        end

        // Shift in 4 bits: 1111
        din = 1; #10; // dout should be 0000
        din = 1; #10; // dout should be 0001
        din = 1; #10; // dout should be 0011
        din = 1; #10; // dout should be 0111

        // Check the output
        if (dout !== 4'b1111) begin
            $display("FAIL: Expected dout = 1111, got dout = %b", dout);
            $finish;
        end

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule