`timescale 1ns/1ps

module tb_fsm_detector_mooreo;

    reg in;
    reg reset;
    reg clk;
    wire out;

    // Instantiate the module under test
    fsm_detector_mooreo uut (
        .in(in),
        .reset(reset),
        .clk(clk),
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
        #10; // Wait for a few clock cycles

        // Release reset
        reset = 0;
        #10;

        // Test sequence 1: Input sequence leading to state s2 and output high
        in = 1; #10; // Move to s1
        in = 0; #10; // Move to s2
        if (uut.out !== 1'b0) begin
            $display("FAIL: Expected out=0 at state s2");
            $finish;
        end
        in = 1; #10; // Move to s3
        if (uut.out !== 1'b1) begin
            $display("FAIL: Expected out=1 at state s3");
            $finish;
        end

        // Test sequence 2: Input sequence leading back to s0
        in = 0; #10; // Move to s2
        if (uut.out !== 1'b0) begin
            $display("FAIL: Expected out=0 at state s2");
            $finish;
        end
        in = 0; #10; // Move to s0
        if (uut.out !== 1'b0) begin
            $display("FAIL: Expected out=0 at state s0");
            $finish;
        end

        // Test sequence 3: Input sequence leading to state s1 and back to s0
        in = 1; #10; // Move to s1
        if (uut.out !== 1'b0) begin
            $display("FAIL: Expected out=0 at state s1");
            $finish;
        end
        in = 0; #10; // Move to s2
        in = 0; #10; // Move to s0
        if (uut.out !== 1'b0) begin
            $display("FAIL: Expected out=0 at state s0");
            $finish;
        end

        // Test sequence 4: Reset functionality
        reset = 1; #10; // Assert reset
        if (uut.out !== 1'b0) begin
            $display("FAIL: Expected out=0 after reset");
            $finish;
        end
        reset = 0; #10; // Release reset

        // Final check
        in = 1; #10; // Move to s1
        in = 0; #10; // Move to s2
        in = 1; #10; // Move to s3
        in = 0; #10; // Move to s2
        if (uut.out !== 1'b0) begin
            $display("FAIL: Expected out=0 at state s2");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule