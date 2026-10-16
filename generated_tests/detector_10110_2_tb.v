`timescale 1ns/1ps

module tb_detector_10110;

    reg clk;
    reg reset;
    reg in_data;
    wire sq_detected;
    reg [2:0] expected_state;

    detector_10110 uut (
        .clk(clk),
        .reset(reset),
        .in_data(in_data),
        .sq_detected(sq_detected)
    );

    initial begin
        clk = 0;
        reset = 1;
        in_data = 0;
        #5 reset = 0; // Release reset
        #5;

        // Test sequence to detect 10110
        // Expected sequence: 1, 0, 1, 1, 0
        // Reset state
        expected_state = 3'b000; // GOTNOTHING
        #10;

        // Input 1
        in_data = 1; #10;
        if (uut.state !== 3'b001) $display("FAIL: Expected state G1 after input 1");

        // Input 0
        in_data = 0; #10;
        if (uut.state !== 3'b010) $display("FAIL: Expected state G10 after input 0");

        // Input 1
        in_data = 1; #10;
        if (uut.state !== 3'b011) $display("FAIL: Expected state G101 after input 1");

        // Input 0
        in_data = 0; #10;
        if (uut.state !== 3'b100) $display("FAIL: Expected state G1011 after input 0");

        // Input 1
        in_data = 1; #10;
        if (uut.state !== 3'b001) $display("FAIL: Expected state G1 after input 1");

        // Input 0
        in_data = 0; #10;
        if (sq_detected !== 1) $display("FAIL: Expected sq_detected to be 1 after input 0");

        // Check final state
        if (uut.state !== 3'b000) $display("FAIL: Expected state GOTNOTHING after detection");

        // Additional checks for no detection
        in_data = 1; #10; // 1
        in_data = 1; #10; // 1
        in_data = 0; #10; // 0
        in_data = 1; #10; // 1
        in_data = 0; #10; // 0
        if (sq_detected !== 0) $display("FAIL: Expected sq_detected to be 0 for non-matching sequence");

        // If all checks pass
        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk; // Clock generation

endmodule