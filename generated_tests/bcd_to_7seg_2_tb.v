`timescale 1ns/1ps

module tb_bcd_to_7seg;

    reg [3:0] bcd_in;
    wire [6:0] seg_out;

    // Instantiate the module under test
    bcd_to_7seg uut (
        .bcd_in(bcd_in),
        .seg_out(seg_out)
    );

    initial begin
        // Test valid BCD inputs
        bcd_in = 4'b0000; #10; // Expect 7'b1000000
        if (seg_out !== 7'b1000000) $display("FAIL: Expected 7'b1000000 for input 0");

        bcd_in = 4'b0001; #10; // Expect 7'b1111001
        if (seg_out !== 7'b1111001) $display("FAIL: Expected 7'b1111001 for input 1");

        bcd_in = 4'b0010; #10; // Expect 7'b0100100
        if (seg_out !== 7'b0100100) $display("FAIL: Expected 7'b0100100 for input 2");

        bcd_in = 4'b0011; #10; // Expect 7'b0110000
        if (seg_out !== 7'b0110000) $display("FAIL: Expected 7'b0110000 for input 3");

        bcd_in = 4'b0100; #10; // Expect 7'b0011001
        if (seg_out !== 7'b0011001) $display("FAIL: Expected 7'b0011001 for input 4");

        bcd_in = 4'b0101; #10; // Expect 7'b0010010
        if (seg_out !== 7'b0010010) $display("FAIL: Expected 7'b0010010 for input 5");

        bcd_in = 4'b0110; #10; // Expect 7'b0000010
        if (seg_out !== 7'b0000010) $display("FAIL: Expected 7'b0000010 for input 6");

        bcd_in = 4'b0111; #10; // Expect 7'b1111000
        if (seg_out !== 7'b1111000) $display("FAIL: Expected 7'b1111000 for input 7");

        bcd_in = 4'b1000; #10; // Expect 7'b0000000
        if (seg_out !== 7'b0000000) $display("FAIL: Expected 7'b0000000 for input 8");

        bcd_in = 4'b1001; #10; // Expect 7'b0010000
        if (seg_out !== 7'b0010000) $display("FAIL: Expected 7'b0010000 for input 9");

        // Test invalid BCD inputs
        bcd_in = 4'b1010; #10; // Expect 7'b1111111
        if (seg_out !== 7'b1111111) $display("FAIL: Expected 7'b1111111 for input 10");

        bcd_in = 4'b1111; #10; // Expect 7'b1111111
        if (seg_out !== 7'b1111111) $display("FAIL: Expected 7'b1111111 for input 15");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule