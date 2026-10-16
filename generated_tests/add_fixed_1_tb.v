`timescale 1ns/1ps

module tb_add_fixed;

    // Parameters
    parameter N = 8;

    // Inputs
    reg [N-1:0] a;
    reg [N-1:0] b;

    // Outputs
    wire [N-1:0] c;

    // Instantiate the Unit Under Test (UUT)
    add_fixed #(.N(N)) uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Test case 1: Both positive
        a = 8'b00001111; // 15
        b = 8'b00000101; // 5
        #10;
        if (c !== 8'b00010000) $display("FAIL: Test case 1 failed, expected 16, got %b", c);

        // Test case 2: Both negative
        a = 8'b11110000; // -16
        b = 8'b11100000; // -32
        #10;
        if (c !== 8'b11110000) $display("FAIL: Test case 2 failed, expected -48, got %b", c);

        // Test case 3: Positive and negative (a > b)
        a = 8'b00010000; // 16
        b = 8'b11100000; // -32
        #10;
        if (c !== 8'b00010000) $display("FAIL: Test case 3 failed, expected 16, got %b", c);

        // Test case 4: Positive and negative (b > a)
        a = 8'b00000100; // 4
        b = 8'b11101000; // -24
        #10;
        if (c !== 8'b11100100) $display("FAIL: Test case 4 failed, expected -20, got %b", c);

        // Test case 5: Zero cases
        a = 8'b00000000; // 0
        b = 8'b11111111; // -1
        #10;
        if (c !== 8'b11111111) $display("FAIL: Test case 5 failed, expected -1, got %b", c);

        a = 8'b11111111; // -1
        b = 8'b00000000; // 0
        #10;
        if (c !== 8'b11111111) $display("FAIL: Test case 6 failed, expected -1, got %b", c);

        // Test case 7: Both zeros
        a = 8'b00000000; // 0
        b = 8'b00000000; // 0
        #10;
        if (c !== 8'b00000000) $display("FAIL: Test case 7 failed, expected 0, got %b", c);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule