`timescale 1ns/1ps

module tb_b2bcd_a;
    reg [3:0] a;
    wire [4:0] b;

    // Instantiate the module under test
    b2bcd_a uut (
        .a(a),
        .b(b)
    );

    initial begin
        // Test case 1: a = 4'b0000 (should output 00000)
        a = 4'b0000; #10;
        if (b !== 5'b00000) $display("FAIL: Test case 1 failed, expected 00000, got %b", b);

        // Test case 2: a = 4'b0111 (should output 00111)
        a = 4'b0111; #10;
        if (b !== 5'b00111) $display("FAIL: Test case 2 failed, expected 00111, got %b", b);

        // Test case 3: a = 4'b1000 (should output 01000)
        a = 4'b1000; #10;
        if (b !== 5'b01000) $display("FAIL: Test case 3 failed, expected 01000, got %b", b);

        // Test case 4: a = 4'b1010 (should output 01010)
        a = 4'b1010; #10;
        if (b !== 5'b01010) $display("FAIL: Test case 4 failed, expected 01010, got %b", b);

        // Test case 5: a = 4'b1100 (should output 01100)
        a = 4'b1100; #10;
        if (b !== 5'b01100) $display("FAIL: Test case 5 failed, expected 01100, got %b", b);

        // Test case 6: a = 4'b1111 (should output 01111)
        a = 4'b1111; #10;
        if (b !== 5'b01111) $display("FAIL: Test case 6 failed, expected 01111, got %b", b);

        // Test case 7: a = 4'b0011 (should output 00011)
        a = 4'b0011; #10;
        if (b !== 5'b00011) $display("FAIL: Test case 7 failed, expected 00011, got %b", b);

        // Test case 8: a = 4'b0100 (should output 00100)
        a = 4'b0100; #10;
        if (b !== 5'b00100) $display("FAIL: Test case 8 failed, expected 00100, got %b", b);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule