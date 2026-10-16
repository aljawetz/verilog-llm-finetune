`timescale 1ns/1ps

module tb_siso;
    reg clk;
    reg si;
    reg clr;
    wire so;

    // Instantiate the module under test
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
        // Initialize signals
        clr = 1; si = 0;
        #10; // Wait for 10ns
        clr = 0; // Release clear

        // Test 1: Shift in 4 bits
        si = 1; #10; // Shift in 1
        if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
        si = 1; #10; // Shift in 1
        if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
        si = 1; #10; // Shift in 1
        if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);
        si = 1; #10; // Shift in 1
        if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);

        // Test 2: Shift in 4 bits with different input
        si = 0; #10; // Shift in 0
        if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
        si = 0; #10; // Shift in 0
        if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
        si = 0; #10; // Shift in 0
        if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);
        si = 0; #10; // Shift in 0
        if (so !== 1) $display("FAIL: Expected so=1, got so=%b", so);

        // Test 3: Clear the register
        clr = 1; #10; // Assert clear
        if (so !== 0) $display("FAIL: Expected so=0 after clear, got so=%b", so);
        clr = 0; // Release clear

        // Test 4: Shift in alternating bits
        si = 1; #10; // Shift in 1
        si = 0; #10; // Shift in 0
        si = 1; #10; // Shift in 1
        si = 0; #10; // Shift in 0
        if (so !== 0) $display("FAIL: Expected so=0, got so=%b", so);

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule