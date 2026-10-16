`timescale 1ns/1ps

module tb_jk_flip_flop;

    reg j;
    reg k;
    reg clk;
    reg reset;
    wire Q;

    // Instantiate the module under test (uut)
    jk_flip_flop uut (
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
        // Initialize signals
        reset = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test case 1: J=0, K=0 (Q should remain unchanged)
        j = 0; k = 0;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 2: J=0, K=1 (Q should reset to 0)
        j = 0; k = 1;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 3: J=1, K=0 (Q should set to 1)
        j = 1; k = 0;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 4: J=1, K=1 (Q should toggle)
        j = 1; k = 1;
        #10; // Wait for 10ns
        if (Q !== 0) begin
            $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
            $finish;
        end

        // Test case 5: J=1, K=1 (Q should toggle again)
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Test case 5 failed, expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 6: J=0, K=0 (Q should remain unchanged)
        j = 0; k = 0;
        #10; // Wait for 10ns
        if (Q !== 1) begin
            $display("FAIL: Test case 6 failed, expected Q=1, got Q=%b", Q);
            $finish;
        end

        // Test case 7: Reset the flip-flop
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;
        if (Q !== 0) begin
            $display("FAIL: Test case 7 failed, expected Q=0 after reset, got Q=%b", Q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule