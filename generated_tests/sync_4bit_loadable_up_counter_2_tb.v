`timescale 1ns/1ps

module tb_sync_4bit_loadable_up_counter;

    reg [3:0] data;
    reg clk;
    reg rst;
    reg load_en;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    sync_4bit_loadable_up_counter uut (
        .data(data),
        .clk(clk),
        .rst(rst),
        .load_en(load_en),
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
        rst = 1;
        load_en = 0;
        data = 4'b0000;

        // Release reset
        #10;
        rst = 0;

        // Test 1: Incrementing without loading
        #10; // clk = 1
        if (q !== 4'b0001) $display("FAIL: Expected q=0001, got q=%b", q);

        #10; // clk = 2
        if (q !== 4'b0010) $display("FAIL: Expected q=0010, got q=%b", q);

        #10; // clk = 3
        if (q !== 4'b0011) $display("FAIL: Expected q=0011, got q=%b", q);

        // Test 2: Load functionality
        load_en = 1;
        data = 4'b1010; // Load 10
        #10; // clk = 4
        if (q !== 4'b1010) $display("FAIL: Expected q=1010, got q=%b", q);

        // Test 3: Continue incrementing after load
        load_en = 0;
        #10; // clk = 5
        if (q !== 4'b1011) $display("FAIL: Expected q=1011, got q=%b", q);

        #10; // clk = 6
        if (q !== 4'b1100) $display("FAIL: Expected q=1100, got q=%b", q);

        // Test 4: Reset functionality
        rst = 1;
        #10; // clk = 7
        if (q !== 4'b0000) $display("FAIL: Expected q=0000, got q=%b", q);

        // Test 5: Load after reset
        rst = 0;
        load_en = 1;
        data = 4'b0111; // Load 7
        #10; // clk = 8
        if (q !== 4'b0111) $display("FAIL: Expected q=0111, got q=%b", q);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule