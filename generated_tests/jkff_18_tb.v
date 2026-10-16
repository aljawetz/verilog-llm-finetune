`timescale 1ns/1ps

module tb_jkff;

    reg j, k, clk, rst;
    wire q, qbar;

    // Instantiate the module under test
    jkff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; j = 0; k = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test HOLD state
        j = 0; k = 0; #10;
        if (q !== 0 || qbar !== 1) $display("FAIL: HOLD state failed");

        // Test SET state
        j = 1; k = 0; #10;
        if (q !== 1 || qbar !== 0) $display("FAIL: SET state failed");

        // Test RESET state
        j = 0; k = 1; #10;
        if (q !== 0 || qbar !== 1) $display("FAIL: RESET state failed");

        // Test TOGGLE state
        j = 1; k = 1; #10; // First toggle
        if (q !== 1 || qbar !== 0) $display("FAIL: TOGGLE state failed on first toggle");
        #10; // Second toggle
        if (q !== 0 || qbar !== 1) $display("FAIL: TOGGLE state failed on second toggle");

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule