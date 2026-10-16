`timescale 1ns/1ps

module tb_shiftreg_4bit;
    reg a;
    reg clk;
    reg clr;
    wire e;

    // Instantiate the module under test (uut)
    shiftreg_4bit uut (
        .a(a),
        .e(e),
        .clk(clk),
        .clr(clr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        a = 0;
        clr = 0;

        // Apply reset
        #2 clr = 1; // Release reset after 2ns
        #10; // Wait for a few clock cycles

        // Test shifting in a sequence of bits
        a = 1; #10; // Shift in 1
        if (e !== 0) $display("FAIL: Expected e=0 after first shift, got e=%b", e);

        a = 0; #10; // Shift in 0
        if (e !== 1) $display("FAIL: Expected e=1 after second shift, got e=%b", e);

        a = 1; #10; // Shift in 1
        if (e !== 0) $display("FAIL: Expected e=0 after third shift, got e=%b", e);

        a = 0; #10; // Shift in 0
        if (e !== 1) $display("FAIL: Expected e=1 after fourth shift, got e=%b", e);

        // Clear the register
        clr = 0; #2; // Assert clear
        clr = 1; #10; // Release clear
        if (e !== 0) $display("FAIL: Expected e=0 after clear, got e=%b", e);

        // Test with another sequence
        a = 1; #10; // Shift in 1
        a = 1; #10; // Shift in 1
        a = 0; #10; // Shift in 0
        if (e !== 1) $display("FAIL: Expected e=1 after shifting in 1,1,0, got e=%b", e);

        // Final check
        a = 1; #10; // Shift in 1
        if (e !== 0) $display("FAIL: Expected e=0 after shifting in 1,1,0,1, got e=%b", e);

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule