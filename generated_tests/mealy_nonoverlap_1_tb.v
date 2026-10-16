`timescale 1ns/1ps

module tb_mealy_nonoverlap;

    reg din;
    reg clk;
    reg rst;
    wire dout;

    // Instantiate the module under test (uut)
    mealy_nonoverlap uut (
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

        // Test sequence 1: Check state transitions and output
        // s0 -> s1 (din = 1)
        din = 1; #10;
        if (uut.current_state !== 2'b01 || dout !== 1'b0) $display("FAIL: Expected state s1 and dout 0");

        // s1 -> s2 (din = 0)
        din = 0; #10;
        if (uut.current_state !== 2'b10 || dout !== 1'b0) $display("FAIL: Expected state s2 and dout 0");

        // s2 -> s3 (din = 0)
        din = 0; #10;
        if (uut.current_state !== 2'b11 || dout !== 1'b0) $display("FAIL: Expected state s3 and dout 0");

        // s3 -> s0 (din = 1)
        din = 1; #10;
        if (uut.current_state !== 2'b00 || dout !== 1'b1) $display("FAIL: Expected state s0 and dout 1");

        // s0 -> s0 (din = 0)
        din = 0; #10;
        if (uut.current_state !== 2'b00 || dout !== 1'b0) $display("FAIL: Expected state s0 and dout 0");

        // s0 -> s1 (din = 1)
        din = 1; #10;
        if (uut.current_state !== 2'b01 || dout !== 1'b0) $display("FAIL: Expected state s1 and dout 0");

        // s1 -> s2 (din = 0)
        din = 0; #10;
        if (uut.current_state !== 2'b10 || dout !== 1'b0) $display("FAIL: Expected state s2 and dout 0");

        // s2 -> s3 (din = 0)
        din = 0; #10;
        if (uut.current_state !== 2'b11 || dout !== 1'b0) $display("FAIL: Expected state s3 and dout 0");

        // s3 -> s0 (din = 1)
        din = 1; #10;
        if (uut.current_state !== 2'b00 || dout !== 1'b1) $display("FAIL: Expected state s0 and dout 1");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule