`timescale 1ns/1ps

module tb_moore_1110_fsmd;

    reg d_in;
    reg clk;
    reg rst;
    reg [3:0] bit_in; // Assuming N=4 for bit_in and bit_out
    wire y_out;
    wire [3:0] bit_out;

    // Instantiate the module under test
    moore_1110_fsmd uut (
        .d_in(d_in),
        .clk(clk),
        .rst(rst),
        .y_out(y_out),
        .bit_in(bit_in),
        .bit_out(bit_out)
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
        d_in = 0;
        bit_in = 4'b0000;

        // Apply reset
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Test case 1: No pattern
        d_in = 0; #10;
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // Test case 2: Input '1110'
        d_in = 1; #10; // s0 -> s1
        d_in = 1; #10; // s1 -> s2
        d_in = 1; #10; // s2 -> s3
        d_in = 0; #10; // s3 -> s4
        if (y_out !== 1) $display("FAIL: Expected y_out = 1, got %b", y_out);
        
        // Check bit_out
        bit_in = 4'b1010; // Set bit_in to some value
        #10; // Wait for the output to latch
        if (bit_out !== bit_in) $display("FAIL: Expected bit_out = %b, got %b", bit_in, bit_out);

        // Test case 3: Input '1110' again
        d_in = 1; #10; // s0 -> s1
        d_in = 1; #10; // s1 -> s2
        d_in = 1; #10; // s2 -> s3
        d_in = 0; #10; // s3 -> s4
        if (y_out !== 1) $display("FAIL: Expected y_out = 1, got %b", y_out);
        
        // Check bit_out again
        bit_in = 4'b1100; // Change bit_in value
        #10; // Wait for the output to latch
        if (bit_out !== bit_in) $display("FAIL: Expected bit_out = %b, got %b", bit_in, bit_out);

        // Test case 4: Input '0000' after '1110'
        d_in = 0; #10; // s4 -> s0
        if (y_out !== 0) $display("FAIL: Expected y_out = 0, got %b", y_out);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule