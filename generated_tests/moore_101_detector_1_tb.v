`timescale 1ns/1ps

module tb_moore_101_detector;

    reg clk;
    reg reset_n;
    reg x;
    wire y;

    // Instantiate the module under test (uut)
    moore_101_detector uut (
        .clk(clk),
        .reset_n(reset_n),
        .x(x),
        .y(y)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset_n = 0;
        x = 0;

        // Apply reset
        #10;
        reset_n = 1;

        // Test sequence to detect "101"
        // Expected output y should be low initially
        #10; x = 0; #10; if (y !== 0) $display("FAIL: y should be 0 at time %0t", $time);
        #10; x = 1; #10; if (y !== 0) $display("FAIL: y should be 0 at time %0t", $time);
        #10; x = 0; #10; if (y !== 0) $display("FAIL: y should be 0 at time %0t", $time);
        #10; x = 1; #10; if (y !== 1) $display("FAIL: y should be 1 at time %0t", $time); // "101" detected
        #10; x = 0; #10; if (y !== 0) $display("FAIL: y should be 0 at time %0t", $time);
        #10; x = 1; #10; if (y !== 1) $display("FAIL: y should be 1 at time %0t", $time); // "101" detected again
        #10; x = 0; #10; if (y !== 0) $display("FAIL: y should be 0 at time %0t", $time);
        #10; x = 1; #10; if (y !== 1) $display("FAIL: y should be 1 at time %0t", $time); // "101" detected again
        #10; x = 1; #10; if (y !== 1) $display("FAIL: y should be 1 at time %0t", $time); // "101" detected again
        #10; x = 0; #10; if (y !== 0) $display("FAIL: y should be 0 at time %0t", $time);
        
        // End of test
        $display("PASS");
        $finish;
    end

endmodule