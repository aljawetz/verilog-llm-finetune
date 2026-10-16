`timescale 1ns/1ps

module tb_moore_nonoverlap;

    reg i_x;
    reg i_clk;
    reg i_reset;
    wire o_seq_detected;

    // Instantiate the module under test (uut)
    moore_nonoverlap uut (
        .i_x(i_x),
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_seq_detected(o_seq_detected)
    );

    // Clock generation
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        i_x = 0;
        i_reset = 0;

        // Apply reset
        #10;
        i_reset = 1;

        // Test sequence to detect "1001"
        // Expected output: o_seq_detected should be high at the end of "1001"
        #10 i_x = 1; // State A to B
        #10 i_x = 0; // State B to C
        #10 i_x = 0; // State C to D
        #10 i_x = 1; // State D to E
        #10 if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Expected o_seq_detected to be 1 after '1001'");
            $finish;
        end

        // Reset and test another sequence
        #10 i_reset = 0; // Reset the state machine
        #10 i_reset = 1; // Release reset

        // Test sequence to ensure no overlap
        #10 i_x = 1; // State A to B
        #10 i_x = 0; // State B to C
        #10 i_x = 0; // State C to D
        #10 i_x = 1; // State D to E
        #10 if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Expected o_seq_detected to be 1 after '1001'");
            $finish;
        end

        // Test sequence that does not match
        #10 i_x = 1; // State A to B
        #10 i_x = 1; // Stay in B
        #10 i_x = 0; // State B to C
        #10 i_x = 1; // State C to B (not a valid sequence)
        #10 if (o_seq_detected !== 1'b0) begin
            $display("FAIL: Expected o_seq_detected to be 0 for invalid sequence");
            $finish;
        end

        // Final check for another valid sequence
        #10 i_x = 1; // State A to B
        #10 i_x = 0; // State B to C
        #10 i_x = 0; // State C to D
        #10 i_x = 1; // State D to E
        #10 if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Expected o_seq_detected to be 1 after '1001'");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule