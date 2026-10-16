`timescale 1ns/1ps

module tb_shift_reg;

    reg clk;
    reg rst;
    reg SI;
    wire SO;

    // Instantiate the shift register
    shift_reg uut (
        .SO(SO),
        .clk(clk),
        .rst(rst),
        .SI(SI)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        SI = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test shifting with SI = 1
        SI = 1; // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after reset");
        
        // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after first shift");
        
        // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after second shift");
        
        // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after third shift");
        
        // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after fourth shift");
        
        // Continue shifting in 1
        SI = 1; // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after fifth shift");
        
        // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after sixth shift");
        
        // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after seventh shift");
        
        // Shift in 1
        #10; // Wait for one clock cycle
        if (SO !== 0) $display("FAIL: Expected SO = 0 after eighth shift");
        
        // Now shift in 0
        SI = 0; // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 1 eight times");
        
        // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 0");
        
        // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 0");
        
        // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 0");
        
        // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 0");
        
        // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 0");
        
        // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 0");
        
        // Shift in 0
        #10; // Wait for one clock cycle
        if (SO !== 1) $display("FAIL: Expected SO = 1 after shifting in 0");
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule