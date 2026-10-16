`timescale 1ns/1ps

module tb_mealy_nonover;

    reg i_x;
    reg i_reset;
    reg i_clk;
    wire o_seq_detected;

    // Instantiate the module under test (uut)
    mealy_nonover uut (
        .i_x(i_x),
        .i_reset(i_reset),
        .i_clk(i_clk),
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
        i_reset = 0;
        i_x = 0;

        // Apply reset
        #10;
        i_reset = 1; // Release reset
        #10;

        // Test sequence: 0 -> 1 -> 0 -> 0 -> 1 (should detect sequence)
        i_x = 1; #10; // State A to B
        i_x = 0; #10; // State B to C
        i_x = 0; #10; // State C to D
        i_x = 1; #10; // State D, should detect sequence
        if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Sequence not detected when expected.");
            $finish;
        end

        // Reset and test sequence: 0 -> 1 -> 0 -> 1 (should not detect sequence)
        i_reset = 0; #10; // Assert reset
        i_reset = 1; #10; // Release reset
        i_x = 1; #10; // State A to B
        i_x = 0; #10; // State B to C
        i_x = 1; #10; // State C to B, should not detect sequence
        if (o_seq_detected !== 1'b0) begin
            $display("FAIL: Sequence incorrectly detected.");
            $finish;
        end

        // Reset and test sequence: 0 -> 1 -> 0 -> 0 -> 1 -> 0 (should detect sequence)
        i_reset = 0; #10; // Assert reset
        i_reset = 1; #10; // Release reset
        i_x = 1; #10; // State A to B
        i_x = 0; #10; // State B to C
        i_x = 0; #10; // State C to D
        i_x = 1; #10; // State D, should detect sequence
        if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Sequence not detected when expected.");
            $finish;
        end

        // Reset and test sequence: 0 -> 1 -> 0 -> 0 -> 0 (should not detect sequence)
        i_reset = 0; #10; // Assert reset
        i_reset = 1; #10; // Release reset
        i_x = 1; #10; // State A to B
        i_x = 0; #10; // State B to C
        i_x = 0; #10; // State C to D
        i_x = 0; #10; // State D to A, should not detect sequence
        if (o_seq_detected !== 1'b0) begin
            $display("FAIL: Sequence incorrectly detected.");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule