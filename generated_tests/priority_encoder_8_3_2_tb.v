`timescale 1ns/1ps

module tb_priority_encoder_8_3;

reg [7:0] in;
wire [2:0] out;

// Instantiate the module under test (uut)
priority_encoder_8_3 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test case 1: Only the least significant bit is high
    in = 8'b00000001; #10;
    if (out !== 3'b000) begin
        $display("FAIL: Test case 1 failed, expected 000, got %b", out);
        $finish;
    end

    // Test case 2: Second least significant bit is high
    in = 8'b00000010; #10;
    if (out !== 3'b001) begin
        $display("FAIL: Test case 2 failed, expected 001, got %b", out);
        $finish;
    end

    // Test case 3: Third least significant bit is high
    in = 8'b00000100; #10;
    if (out !== 3'b010) begin
        $display("FAIL: Test case 3 failed, expected 010, got %b", out);
        $finish;
    end

    // Test case 4: Fourth least significant bit is high
    in = 8'b00001000; #10;
    if (out !== 3'b011) begin
        $display("FAIL: Test case 4 failed, expected 011, got %b", out);
        $finish;
    end

    // Test case 5: Fifth least significant bit is high
    in = 8'b00010000; #10;
    if (out !== 3'b100) begin
        $display("FAIL: Test case 5 failed, expected 100, got %b", out);
        $finish;
    end

    // Test case 6: Sixth least significant bit is high
    in = 8'b00100000; #10;
    if (out !== 3'b101) begin
        $display("FAIL: Test case 6 failed, expected 101, got %b", out);
        $finish;
    end

    // Test case 7: Seventh least significant bit is high
    in = 8'b01000000; #10;
    if (out !== 3'b110) begin
        $display("FAIL: Test case 7 failed, expected 110, got %b", out);
        $finish;
    end

    // Test case 8: Most significant bit is high
    in = 8'b10000000; #10;
    if (out !== 3'b111) begin
        $display("FAIL: Test case 8 failed, expected 111, got %b", out);
        $finish;
    end

    // Test case 9: Multiple bits high (should take the highest priority)
    in = 8'b11000000; #10;
    if (out !== 3'b111) begin
        $display("FAIL: Test case 9 failed, expected 111, got %b", out);
        $finish;
    end

    // Test case 10: All bits low
    in = 8'b00000000; #10;
    if (out !== 3'bxxx) begin
        $display("FAIL: Test case 10 failed, expected xxx, got %b", out);
        $finish;
    end

    // Test case 11: One bit high with don't care
    in = 8'b00000101; #10;
    if (out !== 3'b010) begin
        $display("FAIL: Test case 11 failed, expected 010, got %b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule