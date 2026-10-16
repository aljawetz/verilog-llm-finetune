`timescale 1ns/1ps

module tb_mealy_1011;

    reg clk;
    reg din;
    reg reset;
    wire dout;

    // Instantiate the module under test
    mealy_1011 uut (
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
        // Initialize inputs
        reset = 1;
        din = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test sequence to detect 1011
        // Input: 1 -> 0 -> 1 -> 1
        #10 din = 1; // State transition to STATE1
        #10 din = 0; // State transition to STATE2
        #10 din = 1; // State transition to STATE3
        #10 din = 1; // Output should be high (dout = 1)
        
        // Check output
        if (dout !== 1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // Reset and test another sequence
        #10 reset = 1;
        #10 reset = 0;

        // Input: 1 -> 0 -> 1 -> 1 -> 0 -> 1
        #10 din = 1; // State transition to STATE1
        #10 din = 0; // State transition to STATE2
        #10 din = 1; // State transition to STATE3
        #10 din = 1; // Output should be high (dout = 1)
        
        // Check output
        if (dout !== 1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // Continue the sequence to reset
        #10 din = 0; // State transition to STATE2
        #10 din = 1; // State transition to STATE3
        #10 din = 1; // Output should be high (dout = 1)

        // Check output
        if (dout !== 1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // Final reset
        #10 reset = 1;
        #10 reset = 0;

        // Input: 0 -> 0 -> 1 -> 0 -> 1 -> 1
        #10 din = 0; // Stay in IDLE
        #10 din = 0; // Stay in IDLE
        #10 din = 1; // State transition to STATE1
        #10 din = 0; // State transition to STATE2
        #10 din = 1; // State transition to STATE3
        #10 din = 1; // Output should be high (dout = 1)

        // Check output
        if (dout !== 1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule