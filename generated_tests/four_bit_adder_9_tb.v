`timescale 1ns/1ps

module tb_four_bit_adder;

    reg clk;
    reg rstn;
    reg [3:0] a;
    reg [3:0] b;
    wire [4:0] c;

    // Instantiate the module under test (uut)
    four_bit_adder uut (
        .clk(clk),
        .rstn(rstn),
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
        // Initialize reset
        rstn = 0;
        a = 0;
        b = 0;
        #10; // Wait for 10ns

        // Release reset
        rstn = 1;
        #10; // Wait for 10ns

        // Test case 1: 3 + 2 = 5
        a = 4'b0011; // 3
        b = 4'b0010; // 2
        #10; // Wait for 10ns
        if (c !== 5'b00101) begin
            $display("FAIL: Expected c = 5'b00101, got c = %b", c);
            $finish;
        end

        // Test case 2: 15 + 1 = 16
        a = 4'b1111; // 15
        b = 4'b0001; // 1
        #10; // Wait for 10ns
        if (c !== 5'b10000) begin
            $display("FAIL: Expected c = 5'b10000, got c = %b", c);
            $finish;
        end

        // Test case 3: Reset functionality
        rstn = 0;
        #10; // Wait for 10ns
        if (c !== 5'b00000) begin
            $display("FAIL: Expected c = 5'b00000 after reset, got c = %b", c);
            $finish;
        end

        // Test case 4: 7 + 8 = 15
        rstn = 1; // Release reset
        a = 4'b0111; // 7
        b = 4'b1000; // 8
        #10; // Wait for 10ns
        if (c !== 5'b01111) begin
            $display("FAIL: Expected c = 5'b01111, got c = %b", c);
            $finish;
        end

        // Test case 5: 0 + 0 = 0
        a = 4'b0000; // 0
        b = 4'b0000; // 0
        #10; // Wait for 10ns
        if (c !== 5'b00000) begin
            $display("FAIL: Expected c = 5'b00000, got c = %b", c);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule