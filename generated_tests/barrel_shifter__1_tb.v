`timescale 1ns/1ps

module tb_barrel_shifter_;

    reg [7:0] a;
    reg [2:0] range;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    barrel_shifter_ uut (
        .a(a),
        .range(range),
        .out(out)
    );

    initial begin
        // Test case 1: No shift (range = 3'b000)
        a = 8'b10101010; range = 3'b000; #10;
        if (out !== 8'b10101010) $display("FAIL: Test case 1 failed, expected 10101010, got %b", out);

        // Test case 2: Shift right by 1 (range = 3'b001)
        a = 8'b10101010; range = 3'b001; #10;
        if (out !== 8'b01010101) $display("FAIL: Test case 2 failed, expected 01010101, got %b", out);

        // Test case 3: Shift right by 2 (range = 3'b011)
        a = 8'b10101010; range = 3'b011; #10;
        if (out !== 8'b10101010) $display("FAIL: Test case 3 failed, expected 10101010, got %b", out);

        // Test case 4: Shift right by 4 (range = 3'b111)
        a = 8'b10101010; range = 3'b111; #10;
        if (out !== 8'b10101010) $display("FAIL: Test case 4 failed, expected 10101010, got %b", out);

        // Test case 5: Shift right by 1 (range = 3'b001) with different input
        a = 8'b00001111; range = 3'b001; #10;
        if (out !== 8'b10000111) $display("FAIL: Test case 5 failed, expected 10000111, got %b", out);

        // Test case 6: Shift right by 2 (range = 3'b010)
        a = 8'b00001111; range = 3'b010; #10;
        if (out !== 8'b11000011) $display("FAIL: Test case 6 failed, expected 11000011, got %b", out);

        // Test case 7: Shift right by 4 (range = 3'b110)
        a = 8'b00001111; range = 3'b110; #10;
        if (out !== 8'b11110000) $display("FAIL: Test case 7 failed, expected 11110000, got %b", out);

        // Test case 8: Shift right by 7 (range = 3'b111)
        a = 8'b00001111; range = 3'b111; #10;
        if (out !== 8'b11110000) $display("FAIL: Test case 8 failed, expected 11110000, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule