`timescale 1ns/1ps

module tb_seven;

    reg a;
    reg b;
    reg c;
    reg d;
    wire [6:0] out;

    // Instantiate the module under test
    seven uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    initial begin
        // Test cases
        // Test case 1: a=0, b=0, c=0, d=0
        a = 0; b = 0; c = 0; d = 0; #10;
        if (out !== 7'b0000000) $display("FAIL: Test case 1 failed, expected 0000000, got %b", out);

        // Test case 2: a=0, b=0, c=0, d=1
        a = 0; b = 0; c = 0; d = 1; #10;
        if (out !== 7'b0000000) $display("FAIL: Test case 2 failed, expected 0000000, got %b", out);

        // Test case 3: a=0, b=0, c=1, d=0
        a = 0; b = 0; c = 1; d = 0; #10;
        if (out !== 7'b0000001) $display("FAIL: Test case 3 failed, expected 0000001, got %b", out);

        // Test case 4: a=0, b=1, c=0, d=0
        a = 0; b = 1; c = 0; d = 0; #10;
        if (out !== 7'b0000000) $display("FAIL: Test case 4 failed, expected 0000000, got %b", out);

        // Test case 5: a=1, b=1, c=1, d=1
        a = 1; b = 1; c = 1; d = 1; #10;
        if (out !== 7'b1111111) $display("FAIL: Test case 5 failed, expected 1111111, got %b", out);

        // Test case 6: a=1, b=0, c=1, d=0
        a = 1; b = 0; c = 1; d = 0; #10;
        if (out !== 7'b1111110) $display("FAIL: Test case 6 failed, expected 1111110, got %b", out);

        // Test case 7: a=1, b=1, c=0, d=0
        a = 1; b = 1; c = 0; d = 0; #10;
        if (out !== 7'b1111111) $display("FAIL: Test case 7 failed, expected 1111111, got %b", out);

        // Test case 8: a=0, b=1, c=1, d=1
        a = 0; b = 1; c = 1; d = 1; #10;
        if (out !== 7'b1111111) $display("FAIL: Test case 8 failed, expected 1111111, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule