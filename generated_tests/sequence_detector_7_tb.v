`timescale 1ns/1ps

module tb_sequence_detector;

reg seq_in;
reg clock;
reg reset;
wire det_o;

// Instantiate the module under test (uut)
sequence_detector uut (
    .seq_in(seq_in),
    .clock(clock),
    .reset(reset),
    .det_o(det_o)
);

// Clock generation
initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    seq_in = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test sequence: "101"
    // Expected output: det_o should go high after the sequence is detected
    seq_in = 1; #10; // State transition to STATE1
    seq_in = 0; #10; // State transition to STATE2
    seq_in = 1; #10; // State transition to STATE3, det_o should be high
    if (det_o !== 1'b1) begin
        $display("FAIL: det_o should be high after detecting '101'");
        $finish;
    end

    // Test sequence: "10"
    seq_in = 1; #10; // Back to STATE1
    seq_in = 0; #10; // Back to STATE2
    if (det_o !== 1'b0) begin
        $display("FAIL: det_o should be low after '10'");
        $finish;
    end

    // Test sequence: "101" again
    seq_in = 1; #10; // Back to STATE1
    seq_in = 0; #10; // Back to STATE2
    seq_in = 1; #10; // Back to STATE3, det_o should be high
    if (det_o !== 1'b1) begin
        $display("FAIL: det_o should be high after detecting '101' again");
        $finish;
    end

    // Test sequence: "0" (should reset to IDLE)
    seq_in = 0; #10; // Transition to IDLE
    if (det_o !== 1'b0) begin
        $display("FAIL: det_o should be low after input '0'");
        $finish;
    end

    // Test sequence: "1010101"
    seq_in = 1; #10; // STATE1
    seq_in = 0; #10; // STATE2
    seq_in = 1; #10; // STATE3, det_o should be high
    if (det_o !== 1'b1) begin
        $display("FAIL: det_o should be high after detecting '101'");
        $finish;
    end
    seq_in = 0; #10; // Back to IDLE
    if (det_o !== 1'b0) begin
        $display("FAIL: det_o should be low after input '0'");
        $finish;
    end
    seq_in = 1; #10; // STATE1
    seq_in = 0; #10; // STATE2
    seq_in = 1; #10; // STATE3, det_o should be high
    if (det_o !== 1'b1) begin
        $display("FAIL: det_o should be high after detecting '101' again");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule