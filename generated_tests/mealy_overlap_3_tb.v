`timescale 1ns/1ps

module tb_mealy_overlap;

    reg clk;
    reg arstn;
    reg in;
    wire out;

    // Instantiate the module under test (uut)
    mealy_overlap uut (
        .clk(clk),
        .arstn(arstn),
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
        // Initialize inputs
        arstn = 0; // Assert reset
        in = 0;
        #10; // Wait for 10ns
        arstn = 1; // Deassert reset

        // Test sequence to detect "101"
        // Input: 0, 1, 0, 1, 0, 1
        // Expected output: 0, 0, 0, 1, 0, 1 (output asserted on second "101")
        
        // Test case 1: No "101" sequence
        #10 in = 0; // State s0, out = 0
        #10 if (out !== 1'b0) $display("FAIL: Expected out=0 at time %t", $time);
        
        #10 in = 1; // State s1, out = 0
        #10 if (out !== 1'b0) $display("FAIL: Expected out=0 at time %t", $time);
        
        #10 in = 0; // State s2, out = 0
        #10 if (out !== 1'b0) $display("FAIL: Expected out=0 at time %t", $time);
        
        #10 in = 1; // State s1, out = 1 (first "101" detected)
        #10 if (out !== 1'b1) $display("FAIL: Expected out=1 at time %t", $time);
        
        #10 in = 0; // State s2, out = 0
        #10 if (out !== 1'b0) $display("FAIL: Expected out=0 at time %t", $time);
        
        #10 in = 1; // State s1, out = 1 (second "101" detected)
        #10 if (out !== 1'b1) $display("FAIL: Expected out=1 at time %t", $time);
        
        // End of test
        $display("PASS");
        $finish;
    end

endmodule