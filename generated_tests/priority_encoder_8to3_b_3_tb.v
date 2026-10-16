`timescale 1ns/1ps

module tb_priority_encoder_8to3_b;

    reg h, g, f, e, d, c, b, a;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    priority_encoder_8to3_b uut (
        .h(h), .g(g), .f(f), .e(e), .d(d), .c(c), .b(b), .a(a), .out(out)
    );

    initial begin
        // Test case 1: Only input 'a' is high
        {h, g, f, e, d, c, b, a} = 8'b00000001; #10;
        if (out !== 3'b000) $display("FAIL: Test case 1 failed");

        // Test case 2: Only input 'b' is high
        {h, g, f, e, d, c, b, a} = 8'b00000010; #10;
        if (out !== 3'b001) $display("FAIL: Test case 2 failed");

        // Test case 3: Only input 'c' is high
        {h, g, f, e, d, c, b, a} = 8'b00000100; #10;
        if (out !== 3'b010) $display("FAIL: Test case 3 failed");

        // Test case 4: Only input 'd' is high
        {h, g, f, e, d, c, b, a} = 8'b00001000; #10;
        if (out !== 3'b011) $display("FAIL: Test case 4 failed");

        // Test case 5: Only input 'e' is high
        {h, g, f, e, d, c, b, a} = 8'b00010000; #10;
        if (out !== 3'b100) $display("FAIL: Test case 5 failed");

        // Test case 6: Only input 'f' is high
        {h, g, f, e, d, c, b, a} = 8'b00100000; #10;
        if (out !== 3'b101) $display("FAIL: Test case 6 failed");

        // Test case 7: Only input 'g' is high
        {h, g, f, e, d, c, b, a} = 8'b01000000; #10;
        if (out !== 3'b110) $display("FAIL: Test case 7 failed");

        // Test case 8: Only input 'h' is high
        {h, g, f, e, d, c, b, a} = 8'b10000000; #10;
        if (out !== 3'b111) $display("FAIL: Test case 8 failed");

        // Test case 9: No inputs are high
        {h, g, f, e, d, c, b, a} = 8'b00000000; #10;
        if (out !== 3'bz) $display("FAIL: Test case 9 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule