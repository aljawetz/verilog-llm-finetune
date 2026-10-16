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
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        S = 0;
        R = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Hold state (S=0, R=0)
        S = 0; R = 0;
        #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 1 failed (Hold state)");
            $finish;
        end

        // Test case 2: Set (S=1, R=0)
        S = 1; R = 0;
        #10;
        if (Q !== 1 || Qn !== 0) begin
            $display("FAIL: Test case 2 failed (Set)");
            $finish;
        end

        // Test case 3: Reset (S=0, R=1)
        S = 0; R = 1;
        #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 3 failed (Reset)");
            $finish;
        end

        // Test case 4: Hold state again (S=0, R=0)
        S = 0; R = 0;
        #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 4 failed (Hold state)");
            $finish;
        end

        // Test case 5: Undefined state (S=1, R=1)
        S = 1; R = 1;
        #10;
        if (Q !== 1'bx || Qn !== 1'bx) begin
            $display("FAIL: Test case 5 failed (Undefined state)");
            $finish;
        end

        // Test case 6: Reset after undefined state (S=0, R=1)
        S = 0; R = 1;
        #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 6 failed (Reset after undefined state)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule