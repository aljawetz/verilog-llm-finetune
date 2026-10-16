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
        // Initialize inputs
        din = 0;
        rst = 1;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Shift in 4 bits
        din = 1; #10; // dout should be 0001
        if (dout !== 4'b0001) $display("FAIL: Expected dout = 0001, got dout = %b", dout);
        
        din = 0; #10; // dout should be 1000
        if (dout !== 4'b1000) $display("FAIL: Expected dout = 1000, got dout = %b", dout);
        
        din = 1; #10; // dout should be 0100
        if (dout !== 4'b0100) $display("FAIL: Expected dout = 0100, got dout = %b", dout);
        
        din = 1; #10; // dout should be 0010
        if (dout !== 4'b0010) $display("FAIL: Expected dout = 0010, got dout = %b", dout);

        // Test case 2: Reset functionality
        rst = 1; #10; // Reset should clear dout
        if (dout !== 4'b0000) $display("FAIL: Expected dout = 0000 after reset, got dout = %b", dout);
        
        rst = 0; // Release reset

        // Test case 3: Shift in another sequence
        din = 1; #10; // dout should be 0001
        if (dout !== 4'b0001) $display("FAIL: Expected dout = 0001, got dout = %b", dout);
        
        din = 0; #10; // dout should be 1000
        if (dout !== 4'b1000) $display("FAIL: Expected dout = 1000, got dout = %b", dout);
        
        din = 1; #10; // dout should be 0100
        if (dout !== 4'b0100) $display("FAIL: Expected dout = 0100, got dout = %b", dout);
        
        din = 0; #10; // dout should be 0010
        if (dout !== 4'b0010) $display("FAIL: Expected dout = 0010, got dout = %b", dout);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule