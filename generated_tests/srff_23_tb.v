`timescale 1ns/1ps

module tb_srff;

    reg clk;
    reg reset;
    reg S;
    reg R;
    wire Q;

    // Instantiate the SR Flip-Flop
    srff uut (
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
        // Initialize
        reset = 1; S = 0; R = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test case 1: Hold state on 00
        S = 0; R = 0; #10;
        if (Q !== 1'b0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 2: Set state on 10
        S = 1; R = 0; #10;
        if (Q !== 1'b1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 3: Reset state on 01
        S = 0; R = 1; #10;
        if (Q !== 1'b0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 4: Hold state on 00
        S = 0; R = 0; #10;
        if (Q !== 1'b0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 5: Undefined state on 11
        S = 1; R = 1; #10;
        if (Q !== 2'bx) $display("FAIL: Expected Q=xx, got Q=%b", Q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule