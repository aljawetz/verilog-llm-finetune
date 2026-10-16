`timescale 1ns/1ps

module tb_D_ff_negedge;

    reg D;
    reg Clock;
    wire Q;
    wire Qbar;

    // Instantiate the D flip-flop module
    D_ff_negedge uut (
        .D(D),
        .Clock(Clock),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    initial begin
        Clock = 0;
        forever #5 Clock = ~Clock; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize D
        D = 0;
        #10; // Wait for the first clock edge

        // Test case 1: D = 0
        D = 0;
        #10; // Wait for the next falling edge
        if (Q !== 0 || Qbar !== 1) begin
            $display("FAIL: Test case 1 failed (D=0)");
            $finish;
        end

        // Test case 2: D = 1
        D = 1;
        #10; // Wait for the next falling edge
        if (Q !== 1 || Qbar !== 0) begin
            $display("FAIL: Test case 2 failed (D=1)");
            $finish;
        end

        // Test case 3: D = 0 again
        D = 0;
        #10; // Wait for the next falling edge
        if (Q !== 0 || Qbar !== 1) begin
            $display("FAIL: Test case 3 failed (D=0)");
            $finish;
        end

        // Test case 4: D = 1 again
        D = 1;
        #10; // Wait for the next falling edge
        if (Q !== 1 || Qbar !== 0) begin
            $display("FAIL: Test case 4 failed (D=1)");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule