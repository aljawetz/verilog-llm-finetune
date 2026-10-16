`timescale 1ns/1ps

module tb_jkff;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the module under test
    jkff uut (
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
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test 1: Check reset functionality
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Set Q to 1
        j = 1; k = 0; // Set condition
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q did not set to 1 when J=1, K=0");
            $finish;
        end

        // Test 3: Clear Q to 0
        j = 0; k = 1; // Clear condition
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q did not clear to 0 when J=0, K=1");
            $finish;
        end

        // Test 4: Toggle Q
        j = 1; k = 1; // Toggle condition
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q did not toggle to 1 when J=1, K=1");
            $finish;
        end

        // Test 5: Toggle Q again
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q did not toggle to 0 when J=1, K=1");
            $finish;
        end

        // Test 6: Hold Q
        j = 0; k = 0; // Hold condition
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Q did not hold at 0 when J=0, K=0");
            $finish;
        end

        // Test 7: Set Q to 1 again
        j = 1; k = 0; // Set condition
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Q did not set to 1 when J=1, K=0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule