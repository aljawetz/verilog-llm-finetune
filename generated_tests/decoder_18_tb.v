`timescale 1ns/1ps

module tb_decoder;

    reg a, b, c;
    wire [7:0] out;

    // Instantiate the decoder module
    decoder uut (
        .a(a),
        .b(b),
        .c(c),
        .out(out)
    );

    initial begin
        // Test all combinations of a, b, c
        // Expected output for each combination
        // 000 -> 00000001
        // 001 -> 00000010
        // 010 -> 00000100
        // 011 -> 00001000
        // 100 -> 00010000
        // 101 -> 00100000
        // 110 -> 01000000
        // 111 -> 10000000
        
        // Test case 1: a=0, b=0, c=0
        a = 0; b = 0; c = 0; #10;
        if (out !== 8'b00000001) $display("FAIL: Test case a=0, b=0, c=0 failed");

        // Test case 2: a=0, b=0, c=1
        a = 0; b = 0; c = 1; #10;
        if (out !== 8'b00000010) $display("FAIL: Test case a=0, b=0, c=1 failed");

        // Test case 3: a=0, b=1, c=0
        a = 0; b = 1; c = 0; #10;
        if (out !== 8'b00000100) $display("FAIL: Test case a=0, b=1, c=0 failed");

        // Test case 4: a=0, b=1, c=1
        a = 0; b = 1; c = 1; #10;
        if (out !== 8'b00001000) $display("FAIL: Test case a=0, b=1, c=1 failed");

        // Test case 5: a=1, b=0, c=0
        a = 1; b = 0; c = 0; #10;
        if (out !== 8'b00010000) $display("FAIL: Test case a=1, b=0, c=0 failed");

        // Test case 6: a=1, b=0, c=1
        a = 1; b = 0; c = 1; #10;
        if (out !== 8'b00100000) $display("FAIL: Test case a=1, b=0, c=1 failed");

        // Test case 7: a=1, b=1, c=0
        a = 1; b = 1; c = 0; #10;
        if (out !== 8'b01000000) $display("FAIL: Test case a=1, b=1, c=0 failed");

        // Test case 8: a=1, b=1, c=1
        a = 1; b = 1; c = 1; #10;
        if (out !== 8'b10000000) $display("FAIL: Test case a=1, b=1, c=1 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule