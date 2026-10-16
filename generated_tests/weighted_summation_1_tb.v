`timescale 1ns/1ps

module tb_weighted_summation;

    reg clock;
    reg reset;
    reg signed [31:0] sum_in;
    reg [15:0] x_in;
    reg [15:0] w_in;
    wire signed [31:0] wsum_out;

    // Instantiate the module under test (uut)
    weighted_summation uut (
        .clock(clock),
        .reset(reset),
        .sum_in(sum_in),
        .x_in(x_in),
        .w_in(w_in),
        .wsum_out(wsum_out)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        sum_in = 0;
        x_in = 0;
        w_in = 0;

        // Release reset
        #10 reset = 0;

        // Test case 1: Basic operation
        sum_in = 10;
        x_in = 2;
        w_in = 3;
        #10; // Wait for clock edge
        if (wsum_out !== 16) $display("FAIL: Expected wsum_out = 16, got %d", wsum_out);

        // Test case 2: Another operation
        sum_in = 20;
        x_in = 4;
        w_in = 5;
        #10; // Wait for clock edge
        if (wsum_out !== 60) $display("FAIL: Expected wsum_out = 60, got %d", wsum_out);

        // Test case 3: Reset functionality
        reset = 1;
        #10; // Wait for clock edge
        reset = 0;
        sum_in = 30;
        x_in = 1;
        w_in = 1;
        #10; // Wait for clock edge
        if (wsum_out !== 0) $display("FAIL: Expected wsum_out = 0 after reset, got %d", wsum_out);

        // Test case 4: Check with negative sum_in
        sum_in = -10;
        x_in = 2;
        w_in = 3;
        #10; // Wait for clock edge
        if (wsum_out !== -4) $display("FAIL: Expected wsum_out = -4, got %d", wsum_out);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule