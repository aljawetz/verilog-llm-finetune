`timescale 1ns/1ps

module tb_priority_encoder_8to3_b;

    reg h, g, f, e, d, c, b, a;
    wire [2:0] out;

    // Instantiate the Unit Under Test (UUT)
    priority_encoder_8to3_b uut (
        .h(h), .g(g), .f(f), .e(e), .d(d), .c(c), .b(b), .a(a), .out(out)
    );

    initial begin
        // Test case 1: Only 'a' is high
        {h, g, f, e, d, c, b, a} = 8'b00000001; #10;
        if (out !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", out);

        // Test case 2: Only 'b' is high
        {h, g, f, e, d, c, b, a} = 8'b00000010; #10;
        if (out !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", out);

        // Test case 3: Only 'c' is high
        {h, g, f, e, d, c, b, a} = 8'b00000100; #10;
        if (out !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", out);

        // Test case 4: Only 'd' is high
        {h, g, f, e, d, c, b, a} = 8'b00001000; #10;
        if (out !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", out);

        // Test case 5: Only 'e' is high
        {h, g, f, e, d, c, b, a} = 8'b00010000; #10;
        if (out !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", out);

        // Test case 6: Only 'f' is high
        {h, g, f, e, d, c, b, a} = 8'b00100000; #10;
        if (out !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", out);

        // Test case 7: Only 'g' is high
        {h, g, f, e, d, c, b, a} = 8'b01000000; #10;
        if (out !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", out);

        // Test case 8: Only 'h' is high
        {h, g, f, e, d, c, b, a} = 8'b10000000; #10;
        if (out !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", out);

        // Test case 9: All inputs low
        {h, g, f, e, d, c, b, a} = 8'b00000000; #10;
        if (out !== 3'bz) $display("FAIL: Test case 9 failed, expected Z, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule