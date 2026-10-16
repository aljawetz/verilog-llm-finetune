`timescale 1ns/1ps

module tb_JK_flipflop;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the JK_flipflop module
    JK_flipflop uut (
        .j(j),
        .k(k),
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
        reset = 1; j = 0; k = 0;
        #10; // Wait for clock edge

        // Test 1: Asynchronous reset
        reset = 0; // Release reset
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not clear Q");
            $finish;
        end

        // Test 2: J = 1, K = 0 (Set Q)
        j = 1; k = 0;
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not set to 1 when J=1, K=0");
            $finish;
        end

        // Test 3: J = 0, K = 1 (Reset Q)
        j = 0; k = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not reset to 0 when J=0, K=1");
            $finish;
        end

        // Test 4: J = 1, K = 1 (Toggle Q)
        j = 1; k = 1;
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle to 1 when J=1, K=1");
            $finish;
        end

        // Test 5: Toggle again
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not toggle to 0 when J=1, K=1");
            $finish;
        end

        // Test 6: Hold state (J=0, K=0)
        j = 0; k = 0;
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q changed when J=0, K=0");
            $finish;
        end

        // Final state check
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Final state of Q is incorrect");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule