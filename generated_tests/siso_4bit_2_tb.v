`timescale 1ns/1ps

module tb_siso_4bit;

    reg din;
    reg clk;
    reg rst;
    wire [3:0] dout;

    // Instantiate the module under test (uut)
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
        // Initialize signals
        din = 0;
        rst = 1; // Assert reset
        #10;
        
        rst = 0; // Deassert reset
        #10;

        // Test shifting in data
        din = 1; #10; // Shift in 1
        if (dout !== 4'b0001) $display("FAIL: dout should be 0001 after first shift");
        
        din = 0; #10; // Shift in 0
        if (dout !== 4'b0001) $display("FAIL: dout should be 0001 after second shift");

        din = 1; #10; // Shift in 1
        if (dout !== 4'b1001) $display("FAIL: dout should be 1001 after third shift");

        din = 1; #10; // Shift in 1
        if (dout !== 4'b1101) $display("FAIL: dout should be 1101 after fourth shift");

        din = 0; #10; // Shift in 0
        if (dout !== 4'b1110) $display("FAIL: dout should be 1110 after fifth shift");

        // Assert reset and check dout
        rst = 1; #10;
        if (dout !== 4'b0000) $display("FAIL: dout should be 0000 after reset");

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule