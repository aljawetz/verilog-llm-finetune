`timescale 1ns/1ps

module tb_detector_10110;

    reg clk;
    reg reset;
    reg in_data;
    wire sq_detected;
    wire [2:0] state;

    // Instantiate the module under test (uut)
    detector_10110 uut (
        .clk(clk),
        .reset(reset),
        .in_data(in_data),
        .sq_detected(sq_detected),
        .state(state)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        in_data = 0;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test sequence to detect 10110
        // Input: 1
        in_data = 1; #10;
        if (state !== 3'b001) $display("FAIL: Expected state G1 after input 1, got %b", state);

        // Input: 0
        in_data = 0; #10;
        if (state !== 3'b010) $display("FAIL: Expected state G10 after input 0, got %b", state);

        // Input: 1
        in_data = 1; #10;
        if (state !== 3'b011) $display("FAIL: Expected state G101 after input 1, got %b", state);

        // Input: 1
        in_data = 1; #10;
        if (state !== 3'b100) $display("FAIL: Expected state G1011 after input 1, got %b", state);

        // Input: 0
        in_data = 0; #10;
        if (sq_detected !== 1) $display("FAIL: Expected sq_detected to be 1 after input 0, got %b", sq_detected);
        if (state !== 3'b000) $display("FAIL: Expected state GOTNOTHING after input 0, got %b", state);

        // Reset the module
        reset = 1; #10;
        reset = 0; #10;

        // Input: 1
        in_data = 1; #10;
        // Input: 0
        in_data = 0; #10;
        // Input: 1
        in_data = 1; #10;
        // Input: 1
        in_data = 1; #10;
        // Input: 0
        in_data = 0; #10;
        if (sq_detected !== 1) $display("FAIL: Expected sq_detected to be 1 after input sequence 10110, got %b", sq_detected);
        if (state !== 3'b000) $display("FAIL: Expected state GOTNOTHING after input sequence 10110, got %b", state);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule