`timescale 1ns/1ps

module tb_seq_1010_overlap;

    reg x;
    reg clk;
    reg reset;
    wire z;

    // Instantiate the module under test (uut)
    seq_1010_overlap uut (
        .x(x),
        .clk(clk),
        .reset(reset),
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
        reset = 1;
        x = 0;
        #10; // Wait for 10ns
        reset = 0;

        // Test sequence to check for 1010 detection
        // Expected output z should be high when the sequence 1010 is detected
        // Reset state
        #10; x = 0; // State S0
        #10; x = 1; // State S1
        #10; x = 0; // State S2
        #10; x = 1; // State S3, z should be 1
        #10; x = 0; // State S1, z should be 0
        #10; x = 1; // State S2, z should be 0
        #10; x = 0; // State S0, z should be 0
        #10; x = 1; // State S1, z should be 0
        #10; x = 0; // State S2, z should be 0
        #10; x = 1; // State S3, z should be 1
        #10; x = 0; // State S1, z should be 0
        #10; x = 1; // State S2, z should be 0
        #10; x = 0; // State S0, z should be 0

        // Check final output
        if (z !== 0) begin
            $display("FAIL: Final output is not as expected");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule