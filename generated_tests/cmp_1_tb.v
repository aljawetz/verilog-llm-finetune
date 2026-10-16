`timescale 1ns/1ps

module tb_cmp;

    reg clk;
    reg rst_n;
    reg in_vld;
    reg direction;
    reg signed [15:0] din;
    wire signed [15:0] dout;

    // Instantiate the module under test (uut)
    cmp uut (
        .clk(clk),
        .rst_n(rst_n),
        .in_vld(in_vld),
        .direction(direction),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        in_vld = 0;
        direction = 0; // Test for minimum first
        din = 16'h0000;

        // Release reset
        #10;
        rst_n = 1;

        // Test case 1: Update minimum
        in_vld = 1; din = 16'h0001; #10;
        if (uut.dout !== 16'h0001) $display("FAIL: Expected dout = 0001, got dout = %h", uut.dout);

        // Test case 2: Update minimum with a smaller value
        din = 16'h0000; #10;
        if (uut.dout !== 16'h0000) $display("FAIL: Expected dout = 0000, got dout = %h", uut.dout);

        // Test case 3: Update maximum
        direction = 1; // Change to maximum
        din = 16'h0002; #10;
        if (uut.dout !== 16'h0002) $display("FAIL: Expected dout = 0002, got dout = %h", uut.dout);

        // Test case 4: Update maximum with a larger value
        din = 16'h0003; #10;
        if (uut.dout !== 16'h0003) $display("FAIL: Expected dout = 0003, got dout = %h", uut.dout);

        // Test case 5: Update maximum with a smaller value
        din = 16'h0001; #10;
        if (uut.dout !== 16'h0003) $display("FAIL: Expected dout = 0003, got dout = %h", uut.dout);

        // Test case 6: Reset the module
        rst_n = 0; #10;
        rst_n = 1; #10;
        in_vld = 1; din = 16'h0004; #10;
        if (uut.dout !== 16'h0004) $display("FAIL: Expected dout = 0004, got dout = %h", uut.dout);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule