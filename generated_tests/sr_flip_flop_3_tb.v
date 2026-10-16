`timescale 1ns/1ps

module tb_sr_flip_flop;

    reg S;
    reg R;
    reg clk;
    reg reset;
    wire Q;
    wire Qn;

    // Instantiate the SR Flip-Flop
    sr_flip_flop uut (
        .S(S),
        .R(R),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qn(Qn)
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
        #10; // Wait for reset to take effect
        reset = 0;

        // Test case 1: Set the flip-flop
        S = 1; R = 0; #10;
        if (Q !== 1 || Qn !== 0) begin
            $display("FAIL: Test case 1 failed (Set condition)");
            $finish;
        end

        // Test case 2: Reset the flip-flop
        S = 0; R = 1; #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 2 failed (Reset condition)");
            $finish;
        end

        // Test case 3: No change
        S = 0; R = 0; #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 3 failed (No change condition)");
            $finish;
        end

        // Test case 4: Invalid state (S=1, R=1)
        S = 1; R = 1; #10;
        if (Q !== 1'bx || Qn !== 1'bx) begin
            $display("FAIL: Test case 4 failed (Invalid state condition)");
            $finish;
        end

        // Test case 5: Reset after invalid state
        S = 0; R = 1; #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 5 failed (Reset after invalid state)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule