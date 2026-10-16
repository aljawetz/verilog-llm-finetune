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

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;

        // Test case 1: Check Q follows D
        d = 1; #10; // Set D to 1
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1");
            $finish;
        end

        // Test case 2: Check Q follows D
        d = 0; #10; // Set D to 0
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0");
            $finish;
        end

        // Test case 3: Check reset functionality
        reset = 1; #10; // Assert reset
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 4: Check Q follows D after reset
        reset = 0; // Release reset
        d = 1; #10; // Set D to 1
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when D is 1 after reset");
            $finish;
        end

        // Test case 5: Check Q follows D
        d = 0; #10; // Set D to 0
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when D is 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule