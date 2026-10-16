`timescale 1ns/1ps

module tb_sr_flipflop;

    reg clk;
    reg reset;
    reg S;
    reg R;
    wire Q;

    // Instantiate the SR flip-flop
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
        // Initialize inputs
        reset = 1;
        S = 0;
        R = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test hold state
        S = 0; R = 0; // Q should hold its value
        #10;
        if (Q !== 1'b0) $display("FAIL: Expected Q=0 after hold, got Q=%b", Q);

        // Test set state
        S = 1; R = 0; // Q should be set to 1
        #10;
        if (Q !== 1'b1) $display("FAIL: Expected Q=1 after set, got Q=%b", Q);

        // Test reset state
        S = 0; R = 1; // Q should be reset to 0
        #10;
        if (Q !== 1'b0) $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);

        // Test hold state again
        S = 0; R = 0; // Q should hold its value
        #10;
        if (Q !== 1'b0) $display("FAIL: Expected Q=0 after hold, got Q=%b", Q);

        // Test indeterminate state
        S = 1; R = 1; // Q should be indeterminate
        #10;
        if (Q !== 2'bxx) $display("FAIL: Expected Q=xx after indeterminate, got Q=%b", Q);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule