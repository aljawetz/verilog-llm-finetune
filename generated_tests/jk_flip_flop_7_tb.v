`timescale 1ns/1ps

module tb_jk_flip_flop;

    reg j, k, clk, reset;
    wire Q;

    // Instantiate the jk_flip_flop module
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
        // Initialize inputs
        reset = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Test case 1: Hold state (j=0, k=0)
        j = 0; k = 0; #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 2: Reset state (j=0, k=1)
        j = 0; k = 1; #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 3: Set state (j=1, k=0)
        j = 1; k = 0; #10;
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 4: Toggle state (j=1, k=1)
        j = 1; k = 1; #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);
        #10; // Wait for another clock edge
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 5: Asynchronous reset
        reset = 1; #10;
        if (Q !== 0) $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule