`timescale 1ns/1ps

module tb_udc_1;

    reg clk;
    reg rst;
    reg c;
    wire [3:0] Q;

    // Instantiate the unit under test (uut)
    udc_1 uut (
        .clk(clk),
        .rst(rst),
        .c(c),
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
        rst = 1;
        c = 0;

        // Apply reset
        #10;
        rst = 0; // Release reset

        // Test counting up
        #10; c = 0; // Count up
        #10; 
        if (Q !== 4'd1) $display("FAIL: Expected Q=1 after counting up once");
        
        #10; 
        if (Q !== 4'd2) $display("FAIL: Expected Q=2 after counting up twice");

        // Test counting down
        #10; c = 1; // Count down
        #10; 
        if (Q !== 4'd1) $display("FAIL: Expected Q=1 after counting down once");

        #10; 
        if (Q !== 4'd0) $display("FAIL: Expected Q=0 after counting down twice");

        // Test reset functionality
        #10; rst = 1; // Assert reset
        #10; 
        if (Q !== 4'd0) $display("FAIL: Expected Q=0 after reset");

        // Test counting up again
        rst = 0; // Release reset
        #10; c = 0; // Count up
        #10; 
        if (Q !== 4'd1) $display("FAIL: Expected Q=1 after counting up once");

        // Test counting down from non-zero
        #10; c = 1; // Count down
        #10; 
        if (Q !== 4'd0) $display("FAIL: Expected Q=0 after counting down once");

        // Test counting down at zero
        #10; c = 1; // Count down
        #10; 
        if (Q !== 4'd0) $display("FAIL: Expected Q=0 after counting down at zero");

        // Final check
        #10; rst = 1; // Assert reset
        #10; 
        if (Q !== 4'd0) $display("FAIL: Expected Q=0 after final reset");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule