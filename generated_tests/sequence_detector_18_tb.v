`timescale 1ns/1ps

module tb_sequence_detector;

reg clock;
reg reset;
reg sequence_in;
wire detector_out;

// Instantiate the module under test
sequence_detector uut (
    .sequence_in(sequence_in),
    .clock(clock),
    .reset(reset),
    .detector_out(detector_out)
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
    sequence_in = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test sequence: 1, 0, 1, 1
    // Expected output: detector_out should be high after the last '1' in the sequence
    sequence_in = 1; #10; // State: One
    sequence_in = 0; #10; // State: OneZero
    sequence_in = 1; #10; // State: OneZeroOne
    sequence_in = 1; #10; // State: OneZeroOneOne, detector_out should be high

    if (detector_out !== 1) begin
        $display("FAIL: Expected detector_out to be 1 after sequence 1011");
        $finish;
    end

    // Reset and test another sequence: 1, 0, 0
    reset = 1; #10; // Reset the FSM
    reset = 0;
    sequence_in = 1; #10; // State: One
    sequence_in = 0; #10; // State: OneZero
    sequence_in = 0; #10; // State: Zero, detector_out should be low

    if (detector_out !== 0) begin
        $display("FAIL: Expected detector_out to be 0 after sequence 100");
        $finish;
    end

    // Reset and test the full sequence again
    reset = 1; #10; // Reset the FSM
    reset = 0;
    sequence_in = 1; #10; // State: One
    sequence_in = 0; #10; // State: OneZero
    sequence_in = 1; #10; // State: OneZeroOne
    sequence_in = 1; #10; // State: OneZeroOneOne, detector_out should be high

    if (detector_out !== 1) begin
        $display("FAIL: Expected detector_out to be 1 after sequence 1011");
        $finish;
    end

    // Final reset and check for low output
    reset = 1; #10; // Reset the FSM
    reset = 0;
    sequence_in = 0; #10; // State: Zero, detector_out should be low

    if (detector_out !== 0) begin
        $display("FAIL: Expected detector_out to be 0 after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule