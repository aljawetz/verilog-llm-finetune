`timescale 1ns/1ps

module tb_gen_fsm;

    reg in;
    reg clk;
    reg reset;
    reg [3:0] seq;
    wire out;

    // Instantiate the module under test (uut)
    gen_fsm uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .seq(seq),
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
        reset = 1;
        in = 0;
        seq = 4'b1010; // Example sequence to detect

        // Apply reset
        #10 reset = 0;

        // Test case 1: Input sequence matches
        #10 in = 1; // s0 -> s1
        #10 in = 0; // s1 -> s2
        #10 in = 1; // s2 -> s3
        #10 in = 0; // s3 -> out = 1 (detected)
        #10 if (uut.out !== 1) $display("FAIL: Expected output 1, got %b", uut.out);

        // Reset and test case 2: Input sequence does not match
        #10 reset = 1; 
        #10 reset = 0;
        #10 in = 0; // s0 -> s0
        #10 in = 1; // s0 -> s1
        #10 in = 1; // s1 -> s0 (wrong input)
        #10 if (uut.out !== 0) $display("FAIL: Expected output 0, got %b", uut.out);

        // Reset and test case 3: Input sequence matches again
        #10 reset = 1; 
        #10 reset = 0;
        #10 in = 1; // s0 -> s1
        #10 in = 0; // s1 -> s2
        #10 in = 1; // s2 -> s3
        #10 in = 0; // s3 -> out = 1 (detected)
        #10 if (uut.out !== 1) $display("FAIL: Expected output 1, got %b", uut.out);

        // Final reset
        #10 reset = 1; 
        #10 $display("PASS");
        $finish;
    end

endmodule