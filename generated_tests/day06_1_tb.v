`timescale 1ns/1ps

module tb_day06;

    // Testbench signals
    reg clk;
    reg rst;
    reg data_in;
    wire data_out;

    // Instantiate the module under test (uut)
    day06 uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)
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
        data_in = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Shift in 1
        data_in = 1; #10;
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after reset");
        
        // Test case 2: Shift in 1, expect data_out = 0
        data_in = 1; #10;
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after first shift");

        // Test case 3: Shift in 1, expect data_out = 0
        data_in = 1; #10;
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after second shift");

        // Test case 4: Shift in 1, expect data_out = 1
        data_in = 1; #10;
        if (data_out !== 1) $display("FAIL: Expected data_out = 1 after third shift");

        // Test case 5: Shift in 0, expect data_out = 1
        data_in = 0; #10;
        if (data_out !== 1) $display("FAIL: Expected data_out = 1 after shifting in 0");

        // Test case 6: Shift in 1, expect data_out = 0
        data_in = 1; #10;
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after shifting in 1");

        // Test case 7: Reset the register
        rst = 1; #10;
        rst = 0; #10;
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after reset");

        // Test case 8: Shift in 1, expect data_out = 0
        data_in = 1; #10;
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after first shift after reset");

        // Test case 9: Shift in 1, expect data_out = 0
        data_in = 1; #10;
        if (data_out !== 0) $display("FAIL: Expected data_out = 0 after second shift after reset");

        // Test case 10: Shift in 1, expect data_out = 1
        data_in = 1; #10;
        if (data_out !== 1) $display("FAIL: Expected data_out = 1 after third shift after reset");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule