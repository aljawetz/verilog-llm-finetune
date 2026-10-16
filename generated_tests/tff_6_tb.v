`timescale 1ns/1ps

module tb_tff;

    // Inputs
    reg t;
    reg clk;
    reg reset;

    // Outputs
    wire Q;

    // Instantiate the Unit Under Test (UUT)
    tff uut (
        .t(t),
        .clk(clk),
        .reset(reset),
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
        t = 0;

        // Wait for a clock edge
        #10;
        reset = 0; // Release reset

        // Test case 1: T = 0, Q should remain 0
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0 and reset is not active");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when T is 1 and reset is not active");
            $finish;
        end

        // Test case 3: T = 1, Q should toggle again
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again with T = 1");
            $finish;
        end

        // Test case 4: T = 0, Q should remain 0
        t = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when T is 0");
            $finish;
        end

        // Test case 5: Reset the flip-flop
        reset = 1;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 6: T = 1, Q should toggle after reset
        reset = 0;
        t = 1;
        #10;
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 after reset and T = 1");
            $finish;
        end

        // Test case 7: T = 1, Q should toggle again
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again with T = 1");
            $finish;
        end

        // Test case 8: T = 0, Q should remain 0
        t = 0;
        #10;
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when T is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule