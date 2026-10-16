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
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1; j = 0; k = 0;
        #10; // Wait for 10 ns
        reset = 0; // Release reset

        // Test case 1: J=0, K=0 (Q should remain unchanged)
        j = 0; k = 0;
        #10; // Wait for one clock cycle
        if (Q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);

        // Test case 2: J=0, K=1 (Q should be reset to 0)
        j = 0; k = 1;
        #10; // Wait for one clock cycle
        if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);

        // Test case 3: J=1, K=0 (Q should be set to 1)
        j = 1; k = 0;
        #10; // Wait for one clock cycle
        if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);

        // Test case 4: J=1, K=1 (Q should toggle)
        j = 1; k = 1;
        #10; // Wait for one clock cycle
        if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
        #10; // Wait for another clock cycle
        if (Q !== 1) $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", Q);

        // Test case 5: Asynchronous reset
        reset = 1;
        #10; // Wait for 10 ns
        if (Q !== 0) $display("FAIL: Test case 5 failed, expected Q=0 after reset, got Q=%b", Q);
        
        // Final check
        $display("PASS");
        $finish;
    end

endmodule