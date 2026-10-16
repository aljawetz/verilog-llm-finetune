`timescale 1ns/1ps

module tb_pe;

    reg clk;
    reg rst;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] c;

    // Instantiate the module under test (uut)
    pe uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .c(c)
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
        a = 32'd0;
        b = 32'd0;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Multiply 3 and 4
        a = 32'd3;
        b = 32'd4;
        #10; // Wait for one clock cycle
        if (c !== 32'd12) begin
            $display("FAIL: Expected c = 12, got c = %d", c);
            $finish;
        end

        // Test case 2: Multiply 5 and 6
        a = 32'd5;
        b = 32'd6;
        #10; // Wait for one clock cycle
        if (c !== 32'd42) begin
            $display("FAIL: Expected c = 42, got c = %d", c);
            $finish;
        end

        // Test case 3: Reset and check
        rst = 1;
        #10; // Wait for reset to take effect
        rst = 0;
        if (c !== 32'd0) begin
            $display("FAIL: Expected c = 0 after reset, got c = %d", c);
            $finish;
        end

        // Test case 4: Multiply 7 and 8
        a = 32'd7;
        b = 32'd8;
        #10; // Wait for one clock cycle
        if (c !== 32'd56) begin
            $display("FAIL: Expected c = 56, got c = %d", c);
            $finish;
        end

        // Test case 5: Multiply 10 and 10
        a = 32'd10;
        b = 32'd10;
        #10; // Wait for one clock cycle
        if (c !== 32'd156) begin
            $display("FAIL: Expected c = 156, got c = %d", c);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule