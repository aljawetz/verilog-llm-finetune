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
        // Test cases
        in = 8'b0000_0000; #10; // No bits set
        if (pos !== 3'o0) $display("FAIL: Expected pos=0 for input 0x00, got pos=%o", pos);

        in = 8'b0000_0001; #10; // LSB set
        if (pos !== 3'o0) $display("FAIL: Expected pos=0 for input 0x01, got pos=%o", pos);

        in = 8'b0000_0010; #10; // 2nd LSB set
        if (pos !== 3'o1) $display("FAIL: Expected pos=1 for input 0x02, got pos=%o", pos);

        in = 8'b0000_0100; #10; // 3rd LSB set
        if (pos !== 3'o2) $display("FAIL: Expected pos=2 for input 0x04, got pos=%o", pos);

        in = 8'b0000_1000; #10; // 4th LSB set
        if (pos !== 3'o3) $display("FAIL: Expected pos=3 for input 0x08, got pos=%o", pos);

        in = 8'b0001_0000; #10; // 5th LSB set
        if (pos !== 3'o4) $display("FAIL: Expected pos=4 for input 0x10, got pos=%o", pos);

        in = 8'b0010_0000; #10; // 6th LSB set
        if (pos !== 3'o5) $display("FAIL: Expected pos=5 for input 0x20, got pos=%o", pos);

        in = 8'b0100_0000; #10; // 7th LSB set
        if (pos !== 3'o6) $display("FAIL: Expected pos=6 for input 0x40, got pos=%o", pos);

        in = 8'b1000_0000; #10; // MSB set
        if (pos !== 3'o7) $display("FAIL: Expected pos=7 for input 0x80, got pos=%o", pos);

        in = 8'b0000_1111; #10; // Multiple bits set
        if (pos !== 3'o0) $display("FAIL: Expected pos=0 for input 0x0F, got pos=%o", pos);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule