`timescale 1ns/1ps

module tb_siso;

    reg clk;
    reg si;
    reg clr;
    wire so;

    // Instantiate the module under test (uut)
    siso uut (
        .clk(clk),
        .si(si),
        .clr(clr),
        .so(so)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        clr = 1; si = 0;
        #10; // Wait for a clock cycle
        clr = 0; // Release clear

        // Test 1: Shift in 1, expect so = 0
        si = 1; #10;
        if (so !== 0) $display("FAIL: Expected so = 0, got %b", so);

        // Test 2: Shift in 1, expect so = 0
        si = 1; #10;
        if (so !== 0) $display("FAIL: Expected so = 0, got %b", so);

        // Test 3: Shift in 1, expect so = 0
        si = 1; #10;
        if (so !== 0) $display("FAIL: Expected so = 0, got %b", so);

        // Test 4: Shift in 1, expect so = 1
        si = 1; #10;
        if (so !== 1) $display("FAIL: Expected so = 1, got %b", so);

        // Test 5: Shift in 0, expect so = 1
        si = 0; #10;
        if (so !== 1) $display("FAIL: Expected so = 1, got %b", so);

        // Test 6: Clear the register
        clr = 1; #10;
        clr = 0; // Release clear

        // Test 7: After clear, expect so = 0
        si = 0; #10;
        if (so !== 0) $display("FAIL: Expected so = 0, got %b", so);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule