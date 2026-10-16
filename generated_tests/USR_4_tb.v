`timescale 1ns/1ps

module tb_USR;

    reg clk;
    reg reset;
    reg [1:0] ctrl;
    reg [3:0] d;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    USR uut (
        .clk(clk),
        .reset(reset),
        .ctrl(ctrl),
        .d(d),
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
        reset = 1;
        ctrl = 2'b00;
        d = 4'b0000;

        // Release reset
        #10 reset = 0;

        // Test 1: Hold state
        #10;
        if (q !== 4'b0000) $display("FAIL: Test 1 failed, expected q=0000, got q=%b", q);

        // Test 2: Load new data
        d = 4'b1010; ctrl = 2'b11; // Load 1010
        #10;
        if (q !== 4'b1010) $display("FAIL: Test 2 failed, expected q=1010, got q=%b", q);

        // Test 3: Shift left
        ctrl = 2'b01; // Shift left
        #10;
        if (q !== 4'b0101) $display("FAIL: Test 3 failed, expected q=0101, got q=%b", q);

        // Test 4: Shift right
        ctrl = 2'b10; // Shift right
        #10;
        if (q !== 4'b1010) $display("FAIL: Test 4 failed, expected q=1010, got q=%b", q);

        // Test 5: Hold state again
        ctrl = 2'b00; // Hold
        #10;
        if (q !== 4'b1010) $display("FAIL: Test 5 failed, expected q=1010, got q=%b", q);

        // Test 6: Reset functionality
        reset = 1; // Assert reset
        #10;
        reset = 0; // Release reset
        #10;
        if (q !== 4'b0000) $display("FAIL: Test 6 failed, expected q=0000, got q=%b", q);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule