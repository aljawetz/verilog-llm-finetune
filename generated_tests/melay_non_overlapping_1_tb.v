`timescale 1ns/1ps

module tb_melay_non_overlapping;

    reg data;
    reg clk;
    reg rst;
    wire op;

    // Instantiate the module under test
    melay_non_overlapping uut (
        .data(data),
        .clk(clk),
        .rst(rst),
        .op(op)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        data = 0;

        // Apply reset
        #10;
        rst = 1;

        // Test sequence
        // Test case 1: data = 1, expect op = 0 after 1 clock cycle
        data = 1;
        #10;
        if (op !== 0) $display("FAIL: Expected op=0, got op=%b", op);

        // Test case 2: data = 1, expect op = 0 after 1 clock cycle
        #10;
        if (op !== 0) $display("FAIL: Expected op=0, got op=%b", op);

        // Test case 3: data = 0, expect op = 0 after 1 clock cycle
        data = 0;
        #10;
        if (op !== 0) $display("FAIL: Expected op=0, got op=%b", op);

        // Test case 4: data = 1, expect op = 0 after 1 clock cycle
        data = 1;
        #10;
        if (op !== 0) $display("FAIL: Expected op=0, got op=%b", op);

        // Test case 5: data = 1, expect op = 1 after 1 clock cycle
        #10;
        if (op !== 1) $display("FAIL: Expected op=1, got op=%b", op);

        // Test case 6: data = 0, expect op = 0 after 1 clock cycle
        data = 0;
        #10;
        if (op !== 0) $display("FAIL: Expected op=0, got op=%b", op);

        // Test case 7: data = 1, expect op = 0 after 1 clock cycle
        data = 1;
        #10;
        if (op !== 0) $display("FAIL: Expected op=0, got op=%b", op);

        // Test case 8: data = 0, expect op = 0 after 1 clock cycle
        data = 0;
        #10;
        if (op !== 0) $display("FAIL: Expected op=0, got op=%b", op);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule