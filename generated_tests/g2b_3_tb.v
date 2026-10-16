`timescale 1ns/1ps

module tb_g2b;

    reg [3:0] in;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    g2b uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases for Gray code to Binary conversion
        // Gray code: 0000 -> Binary: 0000
        in = 4'b0000; #10;
        if (out !== 4'b0000) $display("FAIL: Expected 0000, got %b", out);

        // Gray code: 0001 -> Binary: 0001
        in = 4'b0001; #10;
        if (out !== 4'b0001) $display("FAIL: Expected 0001, got %b", out);

        // Gray code: 0011 -> Binary: 0010
        in = 4'b0011; #10;
        if (out !== 4'b0010) $display("FAIL: Expected 0010, got %b", out);

        // Gray code: 0010 -> Binary: 0011
        in = 4'b0010; #10;
        if (out !== 4'b0011) $display("FAIL: Expected 0011, got %b", out);

        // Gray code: 0110 -> Binary: 0101
        in = 4'b0110; #10;
        if (out !== 4'b0101) $display("FAIL: Expected 0101, got %b", out);

        // Gray code: 0111 -> Binary: 0111
        in = 4'b0111; #10;
        if (out !== 4'b0111) $display("FAIL: Expected 0111, got %b", out);

        // Gray code: 0100 -> Binary: 0100
        in = 4'b0100; #10;
        if (out !== 4'b0100) $display("FAIL: Expected 0100, got %b", out);

        // Gray code: 1111 -> Binary: 1000
        in = 4'b1111; #10;
        if (out !== 4'b1000) $display("FAIL: Expected 1000, got %b", out);

        // Gray code: 1000 -> Binary: 1001
        in = 4'b1000; #10;
        if (out !== 4'b1001) $display("FAIL: Expected 1001, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule