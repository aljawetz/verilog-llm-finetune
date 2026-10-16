`timescale 1ns/1ps

module tb_sr_flip_flop;

    reg S;
    reg R;
    reg clk;
    reg reset;
    wire Q;
    wire Qn;

    // Instantiate the SR flip-flop
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
        // Initialize inputs
        S = 0; R = 0; reset = 0;
        
        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test case 1: Set (S=1, R=0)
        S = 1; R = 0;
        #10;
        if (Q !== 1 || Qn !== 0) begin
            $display("FAIL: Test case 1 failed (Set)");
            $finish;
        end

        // Test case 2: Hold (S=0, R=0)
        S = 0; R = 0;
        #10;
        if (Q !== 1 || Qn !== 0) begin
            $display("FAIL: Test case 2 failed (Hold)");
            $finish;
        end

        // Test case 3: Reset (S=0, R=1)
        S = 0; R = 1;
        #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 3 failed (Reset)");
            $finish;
        end

        // Test case 4: Hold (S=0, R=0)
        S = 0; R = 0;
        #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 4 failed (Hold)");
            $finish;
        end

        // Test case 5: Invalid state (S=1, R=1)
        S = 1; R = 1;
        #10;
        if (Q !== 1'bx || Qn !== 1'bx) begin
            $display("FAIL: Test case 5 failed (Invalid state)");
            $finish;
        end

        // Test case 6: Reset (S=0, R=1)
        S = 0; R = 1;
        #10;
        if (Q !== 0 || Qn !== 1) begin
            $display("FAIL: Test case 6 failed (Reset)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule