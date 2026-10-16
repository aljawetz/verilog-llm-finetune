`timescale 1ns/1ps

module tb_jk_flipflop;

    reg clk;
    reg reset;
    reg J;
    reg K;
    wire Q;

    // Instantiate the module under test (uut)
    jk_flipflop uut (
        .clk(clk),
        .reset(reset),
        .J(J),
        .K(K),
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
        reset = 1; J = 0; K = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test case 1: No change (J=0, K=0)
        J = 0; K = 0;
        #10; // Wait for clock edge
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 2: Reset (J=0, K=1)
        J = 0; K = 1;
        #10; // Wait for clock edge
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 3: Set (J=1, K=0)
        J = 1; K = 0;
        #10; // Wait for clock edge
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 4: Toggle (J=1, K=1)
        J = 1; K = 1;
        #10; // Wait for clock edge
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);
        
        #10; // Wait for clock edge
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 5: No change (J=0, K=0)
        J = 0; K = 0;
        #10; // Wait for clock edge
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 6: Asynchronous reset
        reset = 1;
        #10; // Wait for reset
        if (Q !== 0) $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
        
        // End of tests
        $display("PASS");
        $finish;
    end

endmodule