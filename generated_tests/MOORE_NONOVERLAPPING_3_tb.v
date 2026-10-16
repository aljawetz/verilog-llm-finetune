`timescale 1ns/1ps

module tb_MOORE_NONOVERLAPPING;

    reg din;
    reg clk;
    reg reset;
    wire dout;

    // Instantiate the module under test
    MOORE_NONOVERLAPPING uut (
        .din(din),
        .clk(clk),
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
        din = 0;
        reset = 1;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test sequence to check state transitions and output
        // Input sequence: 1, 0, 0, 1, 1
        #10 din = 1; // Move to state s1
        #10 din = 0; // Move to state s2
        #10 din = 0; // Move to state s3
        #10 din = 1; // Move to state s4
        #10 din = 1; // Output should be 1 (dout = 1)
        
        // Check output
        if (dout !== 1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // Continue testing the pattern
        #10 din = 0; // Move to state s0
        #10 din = 1; // Move to state s1
        #10 din = 0; // Move to state s2
        #10 din = 0; // Move to state s3
        #10 din = 1; // Move to state s4
        #10 din = 1; // Output should be 1 (dout = 1)

        // Check output
        if (dout !== 1) begin
            $display("FAIL: Expected dout = 1, got dout = %b", dout);
            $finish;
        end

        // Final check to ensure state resets correctly
        #10 din = 0; // Move to state s0
        #10 din = 1; // Move to state s1
        #10 din = 0; // Move to state s2
        #10 din = 0; // Move to state s3
        #10 din = 1; // Move to state s4
        #10 din = 1; // Output should be 1 (dout = 1)

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