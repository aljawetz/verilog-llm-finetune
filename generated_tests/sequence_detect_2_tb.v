`timescale 1ns/1ps

module tb_sequence_detect;
    reg clk;
    reg rst;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    sequence_detect uut (
        .clk(clk),
        .rst(rst),
        .in(in),
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
        rst = 1;
        in = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test sequence: 1011
        // Expected output: out should be high after the last '1' of '1011'
        
        // Input sequence: 1
        in = 1; #10;
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);
        
        // Input sequence: 0
        in = 0; #10;
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);
        
        // Input sequence: 1
        in = 1; #10;
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);
        
        // Input sequence: 1
        in = 1; #10;
        if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

        // Reset the FSM
        rst = 1; #10;
        rst = 0;

        // Test sequence: 1010 (should not detect)
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        // Test sequence: 1001 (should not detect)
        in = 1; #10;
        in = 0; #10;
        in = 0; #10;
        in = 1; #10;
        if (out !== 0) $display("FAIL: Expected out=0, got out=%b", out);

        // Test sequence: 1011 (should detect again)
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;
        if (out !== 1) $display("FAIL: Expected out=1, got out=%b", out);

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule