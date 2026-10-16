`timescale 1ns/1ps

module tb_moore_10101_3ov;

    reg d_in;
    reg clk;
    reg rst;
    wire y_out;

    // Instantiate the module under test (uut)
    moore_10101_3ov uut (
        .d_in(d_in),
        .clk(clk),
        .rst(rst),
        .y_out(y_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        d_in = 0;
        #10;

        // Apply reset
        rst = 0;
        #10;
        rst = 1;
        #10;

        // Test sequence for 10101
        d_in = 1; #10; // s0 -> s1
        d_in = 0; #10; // s1 -> s2
        d_in = 1; #10; // s2 -> s3
        d_in = 0; #10; // s3 -> s4
        d_in = 1; #10; // s4 -> s5
        if (y_out !== 1) begin
            $display("FAIL: Expected y_out = 1 after input sequence 10101");
            $finish;
        end

        // Reset and test another sequence
        rst = 0; #10;
        rst = 1; #10;

        // Test sequence for 101010 (should not match)
        d_in = 1; #10; // s0 -> s1
        d_in = 0; #10; // s1 -> s2
        d_in = 1; #10; // s2 -> s3
        d_in = 0; #10; // s3 -> s4
        d_in = 1; #10; // s4 -> s5
        d_in = 0; #10; // s5 -> s4 (should not output 1)
        if (y_out !== 0) begin
            $display("FAIL: Expected y_out = 0 after input sequence 101010");
            $finish;
        end

        // Test sequence for 10101 again
        d_in = 1; #10; // s4 -> s5
        if (y_out !== 1) begin
            $display("FAIL: Expected y_out = 1 after input sequence 10101");
            $finish;
        end

        // Final reset
        rst = 0; #10;
        $display("PASS");
        $finish;
    end

endmodule