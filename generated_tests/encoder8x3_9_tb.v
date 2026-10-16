`timescale 1ns/1ps

module tb_encoder8x3;

reg [7:0] d;
wire [2:0] y;

// Instantiate the encoder8x3 module
encoder8x3 uut (
    .d(d),
    .y(y)
);

initial begin
    // Test case 1: One-hot input for the first bit
    d = 8'b00000001; #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 3'b000, got %b", y);

    // Test case 2: One-hot input for the second bit
    d = 8'b00000010; #10;
    if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 3'b001, got %b", y);

    // Test case 3: One-hot input for the third bit
    d = 8'b00000100; #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 3'b010, got %b", y);

    // Test case 4: One-hot input for the fourth bit
    d = 8'b00001000; #10;
    if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 3'b011, got %b", y);

    // Test case 5: One-hot input for the fifth bit
    d = 8'b00010000; #10;
    if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 3'b100, got %b", y);

    // Test case 6: One-hot input for the sixth bit
    d = 8'b00100000; #10;
    if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 3'b101, got %b", y);

    // Test case 7: One-hot input for the seventh bit
    d = 8'b01000000; #10;
    if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 3'b110, got %b", y);

    // Test case 8: One-hot input for the eighth bit
    d = 8'b10000000; #10;
    if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 3'b111, got %b", y);

    // Test case 9: No input (default case)
    d = 8'b00000000; #10;
    if (y !== 3'b000) $display("FAIL: Test case 9 failed, expected 3'b000, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule