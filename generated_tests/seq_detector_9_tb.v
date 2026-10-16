`timescale 1ns/1ps

module tb_seq_detector;

    reg inp;
    reg clk;
    reg reset;
    wire det;

    // Instantiate the module under test (uut)
    seq_detector uut (
        .det(det),
        .inp(inp),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        inp = 0;
        reset = 1;

        // Apply reset
        #10 reset = 0;

        // Test sequence: 001
        // Expected output: det should be 1 when reaching state S3
        #10 inp = 0; // S0 -> S1
        #10 inp = 0; // S1 -> S2
        #10 inp = 1; // S2 -> S3, det should be 1
        #10 if (det !== 1) begin
            $display("FAIL: Expected det = 1, got det = %b", det);
            $finish;
        end

        // Continue testing with more sequences
        #10 inp = 0; // S3 -> S1
        #10 if (det !== 0) begin
            $display("FAIL: Expected det = 0, got det = %b", det);
            $finish;
        end

        #10 inp = 0; // S1 -> S2
        #10 if (det !== 0) begin
            $display("FAIL: Expected det = 0, got det = %b", det);
            $finish;
        end

        #10 inp = 1; // S2 -> S3, det should be 1
        #10 if (det !== 1) begin
            $display("FAIL: Expected det = 1, got det = %b", det);
            $finish;
        end

        // Test with a sequence that does not produce a detection
        #10 inp = 1; // S3 -> S0
        #10 if (det !== 0) begin
            $display("FAIL: Expected det = 0, got det = %b", det);
            $finish;
        end

        // Final sequence
        #10 inp = 0; // S0 -> S1
        #10 inp = 0; // S1 -> S2
        #10 inp = 1; // S2 -> S3, det should be 1
        #10 if (det !== 1) begin
            $display("FAIL: Expected det = 1, got det = %b", det);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule