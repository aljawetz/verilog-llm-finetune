`timescale 1ns/1ps

module tb_seq_1010;

    reg clk;
    reg din;
    reg reset;
    wire dout;

    // Instantiate the module under test
    seq_1010 uut (
        .clk(clk),
        .din(din),
        .reset(reset),
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
        reset = 1;
        din = 0;
        #10; // Wait for 10ns
        reset = 0;

        // Test case 1: Sequence 1010
        din = 1; #10; // Input 1
        din = 0; #10; // Input 0
        din = 1; #10; // Input 1
        din = 0; #10; // Input 0
        if (dout !== 1) begin
            $display("FAIL: Expected dout to be 1 after 1010 sequence");
            $finish;
        end

        // Test case 2: Sequence 1010 with extra bits
        din = 1; #10; // Input 1
        din = 0; #10; // Input 0
        din = 1; #10; // Input 1
        din = 0; #10; // Input 0
        if (dout !== 1) begin
            $display("FAIL: Expected dout to be 1 after second 1010 sequence");
            $finish;
        end

        // Test case 3: Sequence 1001 (should not trigger dout)
        din = 1; #10; // Input 1
        din = 0; #10; // Input 0
        din = 0; #10; // Input 0
        din = 1; #10; // Input 1
        if (dout !== 0) begin
            $display("FAIL: Expected dout to be 0 after 1001 sequence");
            $finish;
        end

        // Test case 4: Reset functionality
        reset = 1; #10; // Assert reset
        reset = 0; #10; // Deassert reset
        din = 1; #10; // Input 1
        din = 0; #10; // Input 0
        din = 1; #10; // Input 1
        din = 0; #10; // Input 0
        if (dout !== 1) begin
            $display("FAIL: Expected dout to be 1 after reset and 1010 sequence");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule