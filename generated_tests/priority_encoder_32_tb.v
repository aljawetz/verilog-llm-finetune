`timescale 1ns/1ps

module tb_priority_encoder;
    reg [7:0] in;
    wire [2:0] code;

    // Instantiate the unit under test (uut)
    priority_encoder uut (
        .in(in),
        .code(code)
    );

    initial begin
        // Test case 1: Only the least significant bit is high
        in = 8'b00000001; #10;
        if (code !== 3'b000) $display("FAIL: Expected code 000 for input 00000001, got %b", code);

        // Test case 2: Second bit is high
        in = 8'b00000010; #10;
        if (code !== 3'b001) $display("FAIL: Expected code 001 for input 00000010, got %b", code);

        // Test case 3: Fourth bit is high
        in = 8'b00001000; #10;
        if (code !== 3'b011) $display("FAIL: Expected code 011 for input 00001000, got %b", code);

        // Test case 4: Fifth bit is high
        in = 8'b00010000; #10;
        if (code !== 3'b100) $display("FAIL: Expected code 100 for input 00010000, got %b", code);

        // Test case 5: Multiple bits high, should return the lowest index
        in = 8'b00011000; #10;
        if (code !== 3'b000) $display("FAIL: Expected code 000 for input 00011000, got %b", code);

        // Test case 6: No bits high
        in = 8'b00000000; #10;
        if (code !== 3'bxxx) $display("FAIL: Expected code xxx for input 00000000, got %b", code);

        // Test case 7: Highest bit is high
        in = 8'b10000000; #10;
        if (code !== 3'b111) $display("FAIL: Expected code 111 for input 10000000, got %b", code);

        // Test case 8: Random bits high
        in = 8'b10101010; #10;
        if (code !== 3'b000) $display("FAIL: Expected code 000 for input 10101010, got %b", code);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule