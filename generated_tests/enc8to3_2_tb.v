`timescale 1ns/1ps

module tb_enc8to3;
    reg [7:0] in;
    reg en;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    enc8to3 uut (
        .in(in),
        .en(en),
        .y(y)
    );

    initial begin
        // Test Case 1: Enable with valid input
        en = 1;
        in = 8'b00000001; #10;
        if (y !== 3'b000) $display("FAIL: Expected 3'b000 for input 8'b00000001, got %b", y);

        in = 8'b00000010; #10;
        if (y !== 3'b001) $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", y);

        in = 8'b00000100; #10;
        if (y !== 3'b010) $display("FAIL: Expected 3'b010 for input 8'b00000100, got %b", y);

        in = 8'b00001000; #10;
        if (y !== 3'b011) $display("FAIL: Expected 3'b011 for input 8'b00001000, got %b", y);

        in = 8'b00010000; #10;
        if (y !== 3'b100) $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", y);

        in = 8'b00100000; #10;
        if (y !== 3'b101) $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", y);

        in = 8'b01000000; #10;
        if (y !== 3'b110) $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", y);

        in = 8'b10000000; #10;
        if (y !== 3'b111) $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", y);

        // Test Case 2: Enable with invalid input
        in = 8'b00000000; #10;
        if (y !== 3'bzzz) $display("FAIL: Expected 3'bzzz for input 8'b00000000, got %b", y);

        // Test Case 3: Disable the encoder
        en = 0; in = 8'b00000001; #10;
        if (y !== 3'bxxx) $display("FAIL: Expected 3'bxxx when disabled, got %b", y);

        en = 1; in = 8'b11111111; #10;
        if (y !== 3'bzzz) $display("FAIL: Expected 3'bzzz for input 8'b11111111, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule