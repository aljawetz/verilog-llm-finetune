`timescale 1ns/1ps

module tb_top_module;

    reg clk;
    reg slowena;
    reg reset;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    top_module uut (
        .clk(clk),
        .slowena(slowena),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        slowena = 0;
        reset = 1; // Start with reset active
        #10; // Wait for a clock edge
        reset = 0; // Deactivate reset

        // Test counting with slowena high
        slowena = 1;
        #10; // Wait for 1 clock cycle
        if (q !== 1) $display("FAIL: Expected q = 1, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 2) $display("FAIL: Expected q = 2, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 3) $display("FAIL: Expected q = 3, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 4) $display("FAIL: Expected q = 4, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 5) $display("FAIL: Expected q = 5, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 6) $display("FAIL: Expected q = 6, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 7) $display("FAIL: Expected q = 7, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 8) $display("FAIL: Expected q = 8, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 9) $display("FAIL: Expected q = 9, got q = %d", q);

        // Test reset functionality
        reset = 1; // Activate reset
        #10; // Wait for a clock edge
        if (q !== 0) $display("FAIL: Expected q = 0 after reset, got q = %d", q);

        reset = 0; // Deactivate reset
        #10; // Wait for a clock edge
        slowena = 1; // Enable slowena

        // Test counting after reset
        #10; // Wait for 1 clock cycle
        if (q !== 1) $display("FAIL: Expected q = 1 after reset, got q = %d", q);

        // Test q reaching 9 and resetting
        #80; // Wait for 8 more clock cycles
        if (q !== 9) $display("FAIL: Expected q = 9, got q = %d", q);

        #10; // Wait for 1 clock cycle
        if (q !== 0) $display("FAIL: Expected q = 0 after reaching 9, got q = %d", q);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule