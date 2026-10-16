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
        j = 0; k = 0; reset = 1; #10; // Assert reset
        reset = 0; #10; // Release reset

        // Test case 1: Maintain state (j=0, k=0)
        j = 0; k = 0; #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 2: Clear (j=0, k=1)
        j = 0; k = 1; #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);

        // Test case 3: Set (j=1, k=0)
        j = 1; k = 0; #10;
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Test case 4: Toggle (j=1, k=1)
        j = 1; k = 1; #10;
        if (Q !== 0) $display("FAIL: Expected Q=0, got Q=%b", Q);
        
        // Toggle again
        #10;
        if (Q !== 1) $display("FAIL: Expected Q=1, got Q=%b", Q);

        // Final reset
        reset = 1; #10; // Assert reset
        if (Q !== 0) $display("FAIL: Expected Q=0 after reset, got Q=%b", Q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule