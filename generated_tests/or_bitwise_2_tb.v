`timescale 1ns/1ps

module tb_or_bitwise;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;

    // Output
    wire [7:0] or_result;

    // Instantiate the Unit Under Test (UUT)
    or_bitwise uut (
        .a(a),
        .b(b),
        .or_result(or_result)
    );

    initial begin
        // Test case 1: a = 8'b00000000, b = 8'b00000000
        a = 8'b00000000; b = 8'b00000000;
        #10;
        if (or_result !== 8'b00000000) $display("FAIL: Test case 1 failed");

        // Test case 2: a = 8'b11111111, b = 8'b00000000
        a = 8'b11111111; b = 8'b00000000;
        #10;
        if (or_result !== 8'b11111111) $display("FAIL: Test case 2 failed");

        // Test case 3: a = 8'b00000000, b = 8'b11111111
        a = 8'b00000000; b = 8'b11111111;
        #10;
        if (or_result !== 8'b11111111) $display("FAIL: Test case 3 failed");

        // Test case 4: a = 8'b10101010, b = 8'b01010101
        a = 8'b10101010; b = 8'b01010101;
        #10;
        if (or_result !== 8'b11111111) $display("FAIL: Test case 4 failed");

        // Test case 5: a = 8'b11001100, b = 8'b00110011
        a = 8'b11001100; b = 8'b00110011;
        #10;
        if (or_result !== 8'b11111111) $display("FAIL: Test case 5 failed");

        // Test case 6: a = 8'b11110000, b = 8'b00001111
        a = 8'b11110000; b = 8'b00001111;
        #10;
        if (or_result !== 8'b11111111) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule