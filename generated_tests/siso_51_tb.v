`timescale 1ns/1ps

module tb_siso;

    reg din;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    siso uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        din = 0;
        rst = 1;

        // Reset the shift register
        #10;
        rst = 0;

        // Test sequence
        // Shift in 4 bits: 1010
        din = 1; #10; // Shift in 1
        if (q !== 0) $display("FAIL: Expected q=0 after first shift"); 
        din = 0; #10; // Shift in 0
        if (q !== 1) $display("FAIL: Expected q=1 after second shift"); 
        din = 1; #10; // Shift in 1
        if (q !== 0) $display("FAIL: Expected q=0 after third shift"); 
        din = 0; #10; // Shift in 0
        if (q !== 1) $display("FAIL: Expected q=1 after fourth shift"); 

        // Check final state
        din = 1; #10; // Shift in 1
        if (q !== 0) $display("FAIL: Expected q=0 after fifth shift"); 

        // Reset the shift register
        rst = 1; #10;
        rst = 0; #10;
        if (q !== 0) $display("FAIL: Expected q=0 after reset"); 

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule