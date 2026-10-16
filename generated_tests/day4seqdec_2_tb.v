`timescale 1ns/1ps

module tb_day4seqdec;

    reg a;
    reg clk;
    reg rst;
    wire y;

    // Instantiate the module under test (uut)
    day4seqdec uut (
        .a(a),
        .clk(clk),
        .rst(rst),
        .y(y)
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
        a = 0;
        #10; // Wait for reset to take effect

        // Release reset
        rst = 0;
        #10;

        // Test sequence to detect pattern 1, 0, 0
        // Step 1: Input 1
        a = 1; #10;
        if (uut.y !== 0) $display("FAIL: y should be 0 after input 1"); 

        // Step 2: Input 0
        a = 0; #10;
        if (uut.y !== 0) $display("FAIL: y should be 0 after input 0"); 

        // Step 3: Input 0
        a = 0; #10;
        if (uut.y !== 1) $display("FAIL: y should be 1 after input 0, 0"); 

        // Reset the FSM
        rst = 1; #10;
        rst = 0; #10;

        // Test sequence to ensure reset works
        a = 1; #10;
        if (uut.y !== 0) $display("FAIL: y should be 0 after reset and input 1"); 

        // Test sequence to detect pattern 1, 0, 0 again
        a = 1; #10;
        if (uut.y !== 0) $display("FAIL: y should be 0 after input 1"); 

        a = 0; #10;
        if (uut.y !== 0) $display("FAIL: y should be 0 after input 0"); 

        a = 0; #10;
        if (uut.y !== 1) $display("FAIL: y should be 1 after input 0, 0"); 

        // Final check to ensure FSM is in idle state
        rst = 1; #10;
        rst = 0; #10;
        a = 1; #10;
        if (uut.y !== 0) $display("FAIL: y should be 0 after reset and input 1"); 

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule