`timescale 1ns/1ps

module tb_fsm_seq_detect_non_overlap;

reg ser_in;
reg clk;
reg rst;
wire out;

// Instantiate the module under test
fsm_seq_detect_non_overlap uut (
    .ser_in(ser_in),
    .clk(clk),
    .rst(rst),
    .out(out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1;
    ser_in = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test sequence: 1001
    // Expected output: High pulse on the last bit of the sequence
    ser_in = 1; #10; // State transition to b
    ser_in = 0; #10; // State transition to c
    ser_in = 0; #10; // State transition to d
    ser_in = 1; #10; // State transition to a, out should be 1

    if (out !== 1) begin
        $display("FAIL: Expected out to be 1 after detecting 1001");
        $finish;
    end

    // Reset and test another sequence: 1001 followed by 1001
    rst = 1; #10; rst = 0;
    ser_in = 1; #10; // State transition to b
    ser_in = 0; #10; // State transition to c
    ser_in = 0; #10; // State transition to d
    ser_in = 1; #10; // State transition to a, out should be 1

    if (out !== 1) begin
        $display("FAIL: Expected out to be 1 after detecting second 1001");
        $finish;
    end

    // Test sequence: 1001 followed by 1001 followed by 0
    rst = 1; #10; rst = 0;
    ser_in = 1; #10; // State transition to b
    ser_in = 0; #10; // State transition to c
    ser_in = 0; #10; // State transition to d
    ser_in = 1; #10; // State transition to a, out should be 1
    ser_in = 0; #10; // State transition to a, out should be 0

    if (out !== 0) begin
        $display("FAIL: Expected out to be 0 after last input");
        $finish;
    end

    // Test sequence: 1001 followed by 1
    rst = 1; #10; rst = 0;
    ser_in = 1; #10; // State transition to b
    ser_in = 0; #10; // State transition to c
    ser_in = 0; #10; // State transition to d
    ser_in = 1; #10; // State transition to a, out should be 1
    ser_in = 1; #10; // State remains at a, out should be 0

    if (out !== 0) begin
        $display("FAIL: Expected out to be 0 after last input");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule