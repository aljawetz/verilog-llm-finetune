`timescale 1ns/1ps

module tb_fsm_detector_mealeyo;

    // Inputs
    reg in;
    reg clk;
    reg reset;

    // Outputs
    wire out;

    // Instantiate the Unit Under Test (UUT)
    fsm_detector_mealeyo uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        in = 0;
        #10; // Wait for 10ns
        
        // Release reset
        reset = 0;
        #10;

        // Test sequence 1: No input, should stay in state s0
        in = 0; #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output should be 0 in state s0");
            $finish;
        end

        // Test sequence 2: Input high, transition to state s1
        in = 1; #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output should be 0 in state s1");
            $finish;
        end

        // Test sequence 3: Input low, transition to state s2
        in = 0; #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output should be 0 in state s2");
            $finish;
        end

        // Test sequence 4: Input high, should output 1 and transition back to state s1
        in = 1; #10;
        if (uut.out !== 1) begin
            $display("FAIL: Output should be 1 in state s2 after input high");
            $finish;
        end

        // Test sequence 5: Input low, transition back to state s0
        in = 0; #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output should be 0 in state s0 after transition");
            $finish;
        end

        // Test sequence 6: Reset the FSM
        reset = 1; #10;
        reset = 0; #10;

        // Final check: Ensure it starts in state s0
        in = 0; #10;
        if (uut.out !== 0) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule