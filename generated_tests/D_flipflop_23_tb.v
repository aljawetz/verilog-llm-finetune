`timescale 1ns/1ps

module tb_D_flipflop;

    reg clk;
    reg reset;
    reg d;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
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
        d = 0;

        // Apply reset
        #10;
        reset = 0; // Release reset

        // Test case 1: Check Q follows D
        d = 1; #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // Test case 2: Check Q follows D
        d = 0; #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Test case 3: Check reset functionality
        reset = 1; #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 4: Check Q follows D after reset
        reset = 0; // Release reset
        d = 1; #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1 after reset");
            $finish;
        end

        // Test case 5: Check Q follows D again
        d = 0; #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule