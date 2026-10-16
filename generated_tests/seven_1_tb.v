`timescale 1ns/1ps

module tb_seven;

    reg a, b, c, d;
    wire [6:0] out;

    // Instantiate the module under test (uut)
    seven uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    initial begin
        // Test all BCD inputs (0 to 9)
        // Expected outputs based on BCD to 7-segment encoding
        // 0: 1111110
        // 1: 0110000
        // 2: 1101101
        // 3: 1111001
        // 4: 0110011
        // 5: 1011011
        // 6: 1011111
        // 7: 1110000
        // 8: 1111111
        // 9: 1111011

        // Test case for 0
        {a, b, c, d} = 4'b0000; #10;
        if (out !== 7'b1111110) $display("FAIL: Input 0 produced incorrect output %b", out);

        // Test case for 1
        {a, b, c, d} = 4'b0001; #10;
        if (out !== 7'b0110000) $display("FAIL: Input 1 produced incorrect output %b", out);

        // Test case for 2
        {a, b, c, d} = 4'b0010; #10;
        if (out !== 7'b1101101) $display("FAIL: Input 2 produced incorrect output %b", out);

        // Test case for 3
        {a, b, c, d} = 4'b0011; #10;
        if (out !== 7'b1111001) $display("FAIL: Input 3 produced incorrect output %b", out);

        // Test case for 4
        {a, b, c, d} = 4'b0100; #10;
        if (out !== 7'b0110011) $display("FAIL: Input 4 produced incorrect output %b", out);

        // Test case for 5
        {a, b, c, d} = 4'b0101; #10;
        if (out !== 7'b1011011) $display("FAIL: Input 5 produced incorrect output %b", out);

        // Test case for 6
        {a, b, c, d} = 4'b0110; #10;
        if (out !== 7'b1011111) $display("FAIL: Input 6 produced incorrect output %b", out);

        // Test case for 7
        {a, b, c, d} = 4'b0111; #10;
        if (out !== 7'b1110000) $display("FAIL: Input 7 produced incorrect output %b", out);

        // Test case for 8
        {a, b, c, d} = 4'b1000; #10;
        if (out !== 7'b1111111) $display("FAIL: Input 8 produced incorrect output %b", out);

        // Test case for 9
        {a, b, c, d} = 4'b1001; #10;
        if (out !== 7'b1111011) $display("FAIL: Input 9 produced incorrect output %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule