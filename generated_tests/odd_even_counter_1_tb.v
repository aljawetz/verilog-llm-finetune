`timescale 1ns/1ps

module tb_odd_even_counter;

    // Parameters
    reg clk;
    reg rst;
    reg [3:0] d_in;
    wire [3:0] count_odd;
    wire [3:0] count_even;

    // Instantiate the module under test (uut)
    odd_even_counter uut (
        .clk(clk),
        .rst(rst),
        .d_in(d_in),
        .count_odd(count_odd),
        .count_even(count_even)
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
        d_in = 4'b0000;

        // Apply reset
        #10;
        rst = 0; // Release reset

        // Test with even numbers
        d_in = 4'b0000; // 0 (even)
        #10;
        if (count_even !== 1 || count_odd !== 0) $display("FAIL: Expected count_even=1, count_odd=0");

        d_in = 4'b0010; // 2 (even)
        #10;
        if (count_even !== 2 || count_odd !== 0) $display("FAIL: Expected count_even=2, count_odd=0");

        d_in = 4'b0100; // 4 (even)
        #10;
        if (count_even !== 3 || count_odd !== 0) $display("FAIL: Expected count_even=3, count_odd=0");

        // Test with odd numbers
        d_in = 4'b0001; // 1 (odd)
        #10;
        if (count_even !== 3 || count_odd !== 1) $display("FAIL: Expected count_even=3, count_odd=1");

        d_in = 4'b0011; // 3 (odd)
        #10;
        if (count_even !== 3 || count_odd !== 2) $display("FAIL: Expected count_even=3, count_odd=2");

        d_in = 4'b0101; // 5 (odd)
        #10;
        if (count_even !== 3 || count_odd !== 3) $display("FAIL: Expected count_even=3, count_odd=3");

        // Reset the counter
        rst = 1;
        #10;
        rst = 0; // Release reset

        // Check counts after reset
        #10;
        if (count_even !== 0 || count_odd !== 0) $display("FAIL: Expected count_even=0, count_odd=0");

        // Finalize the simulation
        $display("PASS");
        $finish;
    end

endmodule