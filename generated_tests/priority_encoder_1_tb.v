`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] in;
    wire [2:0] code;

    // Instantiate the module under test (uut)
    priority_encoder uut (
        .in(in),
        .code(code)
    );

    initial begin
        // Test case 1: Only the least significant bit is active
        in = 8'b00000001; #10;
        if (code !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", code);

        // Test case 2: Second bit is active
        in = 8'b00000010; #10;
        if (code !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", code);

        // Test case 3: Third bit is active
        in = 8'b00000100; #10;
        if (code !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", code);

        // Test case 4: Fourth bit is active
        in = 8'b00001000; #10;
        if (code !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", code);

        // Test case 5: Fifth bit is active
        in = 8'b00010000; #10;
        if (code !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", code);

        // Test case 6: Sixth bit is active
        in = 8'b00100000; #10;
        if (code !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", code);

        // Test case 7: Seventh bit is active
        in = 8'b01000000; #10;
        if (code !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", code);

        // Test case 8: Eighth bit is active
        in = 8'b10000000; #10;
        if (code !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", code);

        // Test case 9: Multiple bits active (lowest priority bit should be selected)
        in = 8'b00000111; #10;
        if (code !== 3'b000) $display("FAIL: Test case 9 failed, expected 000, got %b", code);

        // Test case 10: No bits active
        in = 8'b00000000; #10;
        if (code !== 3'bxxx) $display("FAIL: Test case 10 failed, expected undefined, got %b", code);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule