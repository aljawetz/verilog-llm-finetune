`timescale 1ns/1ps

module tb_seq_detector;
    reg x;
    reg clk;
    reg rst;
    wire z;

    // Instantiate the module under test
    seq_detector uut (
        .x(x),
        .clk(clk),
        .rst(rst),
        .z(z)
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
        x = 0;
        #10;
        
        // Release reset
        rst = 0;
        #10;

        // Test sequence: 0-1-1-0
        // Expected output z should be high after the sequence is detected
        x = 0; #10; // S0
        if (z !== 0) $display("FAIL: Expected z=0 at time %0t", $time);
        
        x = 1; #10; // S1
        if (z !== 0) $display("FAIL: Expected z=0 at time %0t", $time);
        
        x = 1; #10; // S2
        if (z !== 0) $display("FAIL: Expected z=0 at time %0t", $time);
        
        x = 0; #10; // S3
        if (z !== 1) $display("FAIL: Expected z=1 at time %0t", $time);
        
        // Reset and check again
        rst = 1; #10;
        rst = 0; #10;

        // Test sequence again: 0-1-1-0
        x = 0; #10; // S0
        if (z !== 0) $display("FAIL: Expected z=0 at time %0t", $time);
        
        x = 1; #10; // S1
        if (z !== 0) $display("FAIL: Expected z=0 at time %0t", $time);
        
        x = 1; #10; // S2
        if (z !== 0) $display("FAIL: Expected z=0 at time %0t", $time);
        
        x = 0; #10; // S3
        if (z !== 1) $display("FAIL: Expected z=1 at time %0t", $time);
        
        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule