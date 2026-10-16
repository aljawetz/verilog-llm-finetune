`timescale 1ns/1ps

module tb_binary_to_gray;

    reg [3:0] in;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    binary_to_gray uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // Test case 0: 0000 -> 0000
        in = 4'b0000; #10;
        if (out !== 4'b0000) $display("FAIL: Expected 0000 for input 0000, got %b", out);

        // Test case 1: 0001 -> 0001
        in = 4'b0001; #10;
        if (out !== 4'b0001) $display("FAIL: Expected 0001 for input 0001, got %b", out);

        // Test case 2: 0010 -> 0011
        in = 4'b0010; #10;
        if (out !== 4'b0011) $display("FAIL: Expected 0011 for input 0010, got %b", out);

        // Test case 3: 0011 -> 0010
        in = 4'b0011; #10;
        if (out !== 4'b0010) $display("FAIL: Expected 0010 for input 0011, got %b", out);

        // Test case 4: 0100 -> 0011
        in = 4'b0100; #10;
        if (out !== 4'b0011) $display("FAIL: Expected 0011 for input 0100, got %b", out);

        // Test case 5: 0101 -> 0010
        in = 4'b0101; #10;
        if (out !== 4'b0010) $display("FAIL: Expected 0010 for input 0101, got %b", out);

        // Test case 6: 0110 -> 0011
        in = 4'b0110; #10;
        if (out !== 4'b0011) $display("FAIL: Expected 0011 for input 0110, got %b", out);

        // Test case 7: 0111 -> 0010
        in = 4'b0111; #10;
        if (out !== 4'b0010) $display("FAIL: Expected 0010 for input 0111, got %b", out);

        // Test case 8: 1000 -> 1100
        in = 4'b1000; #10;
        if (out !== 4'b1100) $display("FAIL: Expected 1100 for input 1000, got %b", out);

        // Test case 9: 1001 -> 1101
        in = 4'b1001; #10;
        if (out !== 4'b1101) $display("FAIL: Expected 1101 for input 1001, got %b", out);

        // Test case 10: 1010 -> 1111
        in = 4'b1010; #10;
        if (out !== 4'b1111) $display("FAIL: Expected 1111 for input 1010, got %b", out);

        // Test case 11: 1011 -> 1110
        in = 4'b1011; #10;
        if (out !== 4'b1110) $display("FAIL: Expected 1110 for input 1011, got %b", out);

        // Test case 12: 1100 -> 1010
        in = 4'b1100; #10;
        if (out !== 4'b1010) $display("FAIL: Expected 1010 for input 1100, got %b", out);

        // Test case 13: 1101 -> 1011
        in = 4'b1101; #10;
        if (out !== 4'b1011) $display("FAIL: Expected 1011 for input 1101, got %b", out);

        // Test case 14: 1110 -> 1000
        in = 4'b1110; #10;
        if (out !== 4'b1000) $display("FAIL: Expected 1000 for input 1110, got %b", out);

        // Test case 15: 1111 -> 1001
        in = 4'b1111; #10;
        if (out !== 4'b1001) $display("FAIL: Expected 1001 for input 1111, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule