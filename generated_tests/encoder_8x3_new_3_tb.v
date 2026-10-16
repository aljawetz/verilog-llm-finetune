`timescale 1ns/1ps

module tb_encoder_8x3_new;

    reg [7:0] I;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    encoder_8x3_new uut (
        .I(I),
        .y(y)
    );

    initial begin
        // Test case 1: Input is 00000001
        I = 8'b00000001; #10;
        if (y !== 3'b000) $display("FAIL: Expected y = 000 for I = 00000001, got y = %b", y);

        // Test case 2: Input is 00000010
        I = 8'b00000010; #10;
        if (y !== 3'b001) $display("FAIL: Expected y = 001 for I = 00000010, got y = %b", y);

        // Test case 3: Input is 00000100
        I = 8'b00000100; #10;
        if (y !== 3'b010) $display("FAIL: Expected y = 010 for I = 00000100, got y = %b", y);

        // Test case 4: Input is 00001000
        I = 8'b00001000; #10;
        if (y !== 3'b011) $display("FAIL: Expected y = 011 for I = 00001000, got y = %b", y);

        // Test case 5: Input is 00010000
        I = 8'b00010000; #10;
        if (y !== 3'b100) $display("FAIL: Expected y = 100 for I = 00010000, got y = %b", y);

        // Test case 6: Input is 00100000
        I = 8'b00100000; #10;
        if (y !== 3'b101) $display("FAIL: Expected y = 101 for I = 00100000, got y = %b", y);

        // Test case 7: Input is 01000000
        I = 8'b01000000; #10;
        if (y !== 3'b110) $display("FAIL: Expected y = 110 for I = 01000000, got y = %b", y);

        // Test case 8: Input is 10000000
        I = 8'b10000000; #10;
        if (y !== 3'b111) $display("FAIL: Expected y = 111 for I = 10000000, got y = %b", y);

        // Test case 9: Input is 00000000 (should be undefined)
        I = 8'b00000000; #10;
        if (y !== 3'bxxx) $display("FAIL: Expected y = xxx for I = 00000000, got y = %b", y);

        // Test case 10: Input is 11111111 (should be undefined)
        I = 8'b11111111; #10;
        if (y !== 3'bxxx) $display("FAIL: Expected y = xxx for I = 11111111, got y = %b", y);

        $display("PASS");
        $finish;
    end

endmodule