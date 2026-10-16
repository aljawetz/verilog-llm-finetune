`timescale 1ns/1ps

module tb_sync_4bit_mod12_loadable_up_counter;

    reg [3:0] data;
    reg clk;
    reg rst;
    reg load_en;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    sync_4bit_mod12_loadable_up_counter uut (
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

        // Test loading a value less than 12
        load_en = 1; data = 4'b0001; // Load 1
        #10;
        if (q !== 4'b0001) $display("FAIL: Expected q = 1 after loading 1, got q = %b", q);

        load_en = 0; // Disable loading
        #10; // Increment
        if (q !== 4'b0010) $display("FAIL: Expected q = 2 after incrementing, got q = %b", q);

        // Test loading a value equal to 12
        load_en = 1; data = 4'b1100; // Load 12
        #10;
        if (q !== 4'b0000) $display("FAIL: Expected q = 0 after loading 12, got q = %b", q);

        // Test loading a value greater than 12
        load_en = 1; data = 4'b1101; // Load 13
        #10;
        if (q !== 4'b0000) $display("FAIL: Expected q = 0 after loading 13, got q = %b", q);

        // Test normal counting
        load_en = 0; // Disable loading
        #10; // Increment
        if (q !== 4'b0001) $display("FAIL: Expected q = 1 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b0010) $display("FAIL: Expected q = 2 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b0011) $display("FAIL: Expected q = 3 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b0100) $display("FAIL: Expected q = 4 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b0101) $display("FAIL: Expected q = 5 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b0110) $display("FAIL: Expected q = 6 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b0111) $display("FAIL: Expected q = 7 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b1000) $display("FAIL: Expected q = 8 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b1001) $display("FAIL: Expected q = 9 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b1010) $display("FAIL: Expected q = 10 after incrementing, got q = %b", q);

        #10; // Increment
        if (q !== 4'b1011) $display("FAIL: Expected q = 11 after incrementing, got q = %b", q);

        #10; // Increment, should wrap to 0
        if (q !== 4'b0000) $display("FAIL: Expected q = 0 after wrapping, got q = %b", q);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule