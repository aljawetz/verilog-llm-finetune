`timescale 1ns/1ps

module tb_four_bit_adder;

    reg clk;
    reg rstn;
    reg [3:0] a;
    reg [3:0] b;
    wire [4:0] c;

    // Instantiate the module under test
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
        // Initialize signals
        rstn = 0;
        a = 4'b0000;
        b = 4'b0000;

        // Apply reset
        #10;
        rstn = 1; // Release reset

        // Test case 1: 0 + 0
        a = 4'b0000; b = 4'b0000;
        #10;
        if (c !== 5'b00000) begin
            $display("FAIL: Test case 1 failed, expected 00000, got %b", c);
            $finish;
        end

        // Test case 2: 1 + 1
        a = 4'b0001; b = 4'b0001;
        #10;
        if (c !== 5'b00010) begin
            $display("FAIL: Test case 2 failed, expected 00010, got %b", c);
            $finish;
        end

        // Test case 3: 2 + 3
        a = 4'b0010; b = 4'b0011;
        #10;
        if (c !== 5'b00010 + 5'b00011) begin
            $display("FAIL: Test case 3 failed, expected 00010 + 00011 = 000101, got %b", c);
            $finish;
        end

        // Test case 4: 15 + 1 (overflow)
        a = 4'b1111; b = 4'b0001;
        #10;
        if (c !== 5'b10000) begin
            $display("FAIL: Test case 4 failed, expected 10000, got %b", c);
            $finish;
        end

        // Test case 5: Reset functionality
        rstn = 0; // Assert reset
        #10;
        if (c !== 5'b00000) begin
            $display("FAIL: Reset failed, expected 00000, got %b", c);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule