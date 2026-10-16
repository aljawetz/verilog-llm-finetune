`timescale 1ns/1ps

module tb_pe;

// Inputs
reg clk;
reg rst;
reg [31:0] a;
reg [31:0] b;

// Outputs
wire [31:0] c;

// Instantiate the Unit Under Test (UUT)
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
    // Initialize inputs
    rst = 1;
    a = 32'd0;
    b = 32'd0;

    // Wait for a clock cycle
    #10;

    // Release reset
    rst = 0;

    // Test case 1: Multiply 2 and 3, expect c = 6
    a = 32'd2;
    b = 32'd3;
    #10; // Wait for one clock cycle
    if (c !== 32'd6) begin
        $display("FAIL: Expected c = 6, got c = %d", c);
        $finish;
    end

    // Test case 2: Multiply 4 and 5, expect c = 6 + 20 = 26
    a = 32'd4;
    b = 32'd5;
    #10; // Wait for one clock cycle
    if (c !== 32'd26) begin
        $display("FAIL: Expected c = 26, got c = %d", c);
        $finish;
    end

    // Test case 3: Reset the accumulator
    rst = 1;
    #10; // Wait for one clock cycle
    rst = 0;

    // Test case 4: After reset, multiply 1 and 1, expect c = 1
    a = 32'd1;
    b = 32'd1;
    #10; // Wait for one clock cycle
    if (c !== 32'd1) begin
        $display("FAIL: Expected c = 1, got c = %d", c);
        $finish;
    end

    // Test case 5: Multiply 10 and 10, expect c = 1 + 100 = 101
    a = 32'd10;
    b = 32'd10;
    #10; // Wait for one clock cycle
    if (c !== 32'd101) begin
        $display("FAIL: Expected c = 101, got c = %d", c);
        $finish;
    end

    // Test case 6: Large values, multiply 100000 and 200000, expect c = 101 + (100000 * 200000)
    a = 32'd100000;
    b = 32'd200000;
    #10; // Wait for one clock cycle
    if (c !== (32'd101 + 32'd20000000000)) begin
        $display("FAIL: Expected c = %d, got c = %d", (32'd101 + 32'd20000000000), c);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule