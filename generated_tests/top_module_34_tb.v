`timescale 1ns/1ps

module tb_top_module;

    reg [7:0] in;
    wire [2:0] pos;

    // Instantiate the module under test (uut)
    top_module uut (
        .in(in),
        .pos(pos)
    );

    initial begin
        // Test case 1: Only the least significant bit is set
        in = 8'b00000001; #10;
        if (pos !== 3'b000) $display("FAIL: Expected pos=000 for input 00000001, got pos=%b", pos);

        // Test case 2: Second least significant bit is set
        in = 8'b00000010; #10;
        if (pos !== 3'b001) $display("FAIL: Expected pos=001 for input 00000010, got pos=%b", pos);

        // Test case 3: Third least significant bit is set
        in = 8'b00000100; #10;
        if (pos !== 3'b010) $display("FAIL: Expected pos=010 for input 00000100, got pos=%b", pos);

        // Test case 4: Fourth least significant bit is set
        in = 8'b00001000; #10;
        if (pos !== 3'b011) $display("FAIL: Expected pos=011 for input 00001000, got pos=%b", pos);

        // Test case 5: Fifth least significant bit is set
        in = 8'b00010000; #10;
        if (pos !== 3'b100) $display("FAIL: Expected pos=100 for input 00010000, got pos=%b", pos);

        // Test case 6: Sixth least significant bit is set
        in = 8'b00100000; #10;
        if (pos !== 3'b101) $display("FAIL: Expected pos=101 for input 00100000, got pos=%b", pos);

        // Test case 7: Seventh least significant bit is set
        in = 8'b01000000; #10;
        if (pos !== 3'b110) $display("FAIL: Expected pos=110 for input 01000000, got pos=%b", pos);

        // Test case 8: Most significant bit is set
        in = 8'b10000000; #10;
        if (pos !== 3'b111) $display("FAIL: Expected pos=111 for input 10000000, got pos=%b", pos);

        // Test case 9: No bits set
        in = 8'b00000000; #10;
        if (pos !== 3'b000) $display("FAIL: Expected pos=000 for input 00000000, got pos=%b", pos);

        // Test case 10: Multiple bits set (lowest order should be selected)
        in = 8'b00000111; #10;
        if (pos !== 3'b000) $display("FAIL: Expected pos=000 for input 00000111, got pos=%b", pos);

        // Test case 11: Multiple bits set (higher order should not affect)
        in = 8'b11111111; #10;
        if (pos !== 3'b000) $display("FAIL: Expected pos=000 for input 11111111, got pos=%b", pos);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule