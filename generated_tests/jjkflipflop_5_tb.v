`timescale 1ns/1ps

module tb_jjkflipflop;
    reg clk;
    reg rst;
    reg [1:0] jk;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
    jjkflipflop uut (
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst(rst),
        .jk(jk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        jk = 2'b00;
        #10; // Wait for a clock cycle
        rst = 0;

        // Test case 1: Hold state (jk = 00)
        #10;
        if (q !== 0) $display("FAIL: Test case 1 failed, expected q = 0, got q = %b", q);

        // Test case 2: Clear state (jk = 01)
        jk = 2'b01;
        #10;
        if (q !== 0) $display("FAIL: Test case 2 failed, expected q = 0, got q = %b", q);

        // Test case 3: Set state (jk = 10)
        jk = 2'b10;
        #10;
        if (q !== 1) $display("FAIL: Test case 3 failed, expected q = 1, got q = %b", q);

        // Test case 4: Toggle state (jk = 11)
        jk = 2'b11;
        #10;
        if (q !== 0) $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
        
        #10;
        if (q !== 1) $display("FAIL: Test case 4 failed, expected q = 1, got q = %b", q);

        // Test case 5: Reset state
        rst = 1;
        #10;
        if (q !== 0) $display("FAIL: Test case 5 failed, expected q = 0, got q = %b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule