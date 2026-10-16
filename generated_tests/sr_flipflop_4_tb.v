`timescale 1ns/1ps

module tb_sr_flipflop;

    reg clk;
    reg reset;
    reg S;
    reg R;
    wire Q;

    // Instantiate the SR Flip-Flop
    sr_flipflop uut (
        .clk(clk),
        .reset(reset),
        .S(S),
        .R(R),
        .Q(Q)
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
        S = 0;
        R = 0;
        #10; // Wait for 10ns

        // Test 1: Reset the flip-flop
        reset = 1; 
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test 2: Set the flip-flop
        reset = 0; 
        S = 1; 
        R = 0; 
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after setting");
            $finish;
        end

        // Test 3: Reset the flip-flop
        S = 0; 
        R = 1; 
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after resetting");
            $finish;
        end

        // Test 4: Hold state
        S = 0; 
        R = 0; 
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should remain 0 when S and R are both 0");
            $finish;
        end

        // Test 5: Set again
        S = 1; 
        R = 0; 
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after setting again");
            $finish;
        end

        // Test 6: Invalid state (S=1, R=1)
        S = 1; 
        R = 1; 
        #10;
        if (Q !== 1'bx) begin
            $display("FAIL: Q should be undefined (x) when both S and R are 1");
            $finish;
        end

        // Final state check
        reset = 1; 
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after final reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule