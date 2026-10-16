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
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        S = 0;
        R = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;

        // Test case 1: Hold state with S=0, R=0
        #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 2: Set Q to 1 with S=1, R=0
        S = 1; R = 0;
        #10;
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 3: Set Q to 0 with S=0, R=1
        S = 0; R = 1;
        #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 4: Hold state with S=0, R=0
        S = 0; R = 0;
        #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 5: Set Q to unknown with S=1, R=1
        S = 1; R = 1;
        #10;
        if (Q !== 2'bxx) $display("FAIL: Expected Q=xx, got Q=%b", Q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule