`timescale 1ns/1ps

module tb_encoder;

    reg [7:0] prio;
    wire [2:0] Y;

    // Instantiate the module under test (uut)
    encoder uut (
        .prio(prio),
        .Y(Y)
    );

    initial begin
        // Test case 1: Only the first bit is high (prio[0])
        prio = 8'b00000001; #10;
        if (Y !== 3'b000) $display("FAIL: Expected Y = 000 for prio = 00000001, got Y = %b", Y);

        // Test case 2: Only the second bit is high (prio[1])
        prio = 8'b00000010; #10;
        if (Y !== 3'b001) $display("FAIL: Expected Y = 001 for prio = 00000010, got Y = %b", Y);

        // Test case 3: Only the third bit is high (prio[2])
        prio = 8'b00000100; #10;
        if (Y !== 3'b010) $display("FAIL: Expected Y = 010 for prio = 00000100, got Y = %b", Y);

        // Test case 4: Only the fourth bit is high (prio[3])
        prio = 8'b00001000; #10;
        if (Y !== 3'b011) $display("FAIL: Expected Y = 011 for prio = 00001000, got Y = %b", Y);

        // Test case 5: Only the fifth bit is high (prio[4])
        prio = 8'b00010000; #10;
        if (Y !== 3'b100) $display("FAIL: Expected Y = 100 for prio = 00010000, got Y = %b", Y);

        // Test case 6: Only the sixth bit is high (prio[5])
        prio = 8'b00100000; #10;
        if (Y !== 3'b101) $display("FAIL: Expected Y = 101 for prio = 00100000, got Y = %b", Y);

        // Test case 7: Only the seventh bit is high (prio[6])
        prio = 8'b01000000; #10;
        if (Y !== 3'b110) $display("FAIL: Expected Y = 110 for prio = 01000000, got Y = %b", Y);

        // Test case 8: Only the eighth bit is high (prio[7])
        prio = 8'b10000000; #10;
        if (Y !== 3'b111) $display("FAIL: Expected Y = 111 for prio = 10000000, got Y = %b", Y);

        // Test case 9: Multiple bits high (prio[3] and prio[5])
        prio = 8'b00101000; #10;
        if (Y !== 3'b101) $display("FAIL: Expected Y = 101 for prio = 00101000, got Y = %b", Y);

        // Test case 10: All bits low
        prio = 8'b00000000; #10;
        if (Y !== 3'bxxx) $display("FAIL: Expected Y = xxx for prio = 00000000, got Y = %b", Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule