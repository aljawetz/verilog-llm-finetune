`timescale 1ns/1ps

module tb_demux_1to8;

    reg a;
    reg [2:0] s;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    demux_1to8 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select 0, input 1
        a = 1; s = 3'b000; #10;
        if (y !== 8'b00000001) $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);

        // Test case 2: Select 1, input 1
        a = 1; s = 3'b001; #10;
        if (y !== 8'b00000010) $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);

        // Test case 3: Select 2, input 1
        a = 1; s = 3'b010; #10;
        if (y !== 8'b00000100) $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);

        // Test case 4: Select 3, input 1
        a = 1; s = 3'b011; #10;
        if (y !== 8'b00001000) $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);

        // Test case 5: Select 4, input 1
        a = 1; s = 3'b100; #10;
        if (y !== 8'b00010000) $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);

        // Test case 6: Select 5, input 1
        a = 1; s = 3'b101; #10;
        if (y !== 8'b00100000) $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);

        // Test case 7: Select 6, input 1
        a = 1; s = 3'b110; #10;
        if (y !== 8'b01000000) $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);

        // Test case 8: Select 7, input 1
        a = 1; s = 3'b111; #10;
        if (y !== 8'b10000000) $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);

        // Test case 9: Select 0, input 0
        a = 0; s = 3'b000; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);

        // Test case 10: Select 1, input 0
        a = 0; s = 3'b001; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 10 failed, expected 00000000, got %b", y);

        // Test case 11: Select 2, input 0
        a = 0; s = 3'b010; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 11 failed, expected 00000000, got %b", y);

        // Test case 12: Select 3, input 0
        a = 0; s = 3'b011; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 12 failed, expected 00000000, got %b", y);

        // Test case 13: Select 4, input 0
        a = 0; s = 3'b100; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 13 failed, expected 00000000, got %b", y);

        // Test case 14: Select 5, input 0
        a = 0; s = 3'b101; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 14 failed, expected 00000000, got %b", y);

        // Test case 15: Select 6, input 0
        a = 0; s = 3'b110; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 15 failed, expected 00000000, got %b", y);

        // Test case 16: Select 7, input 0
        a = 0; s = 3'b111; #10;
        if (y !== 8'b00000000) $display("FAIL: Test case 16 failed, expected 00000000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule