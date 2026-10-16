`timescale 1ns/1ps

module tb_encoder8x3;

reg [7:0] i;
wire [2:0] y;

// Instantiate the module under test (uut)
encoder8x3 uut (
    .i(i),
    .y(y)
);

initial begin
    // Test case 1: Only the first bit is high
    i = 8'b00000001; // Expected output: 3'b000
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 3'b000 but got %b", y);

    // Test case 2: Only the second bit is high
    i = 8'b00000010; // Expected output: 3'b000
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 2 failed, expected 3'b000 but got %b", y);

    // Test case 3: Third bit high
    i = 8'b00000100; // Expected output: 3'b000
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 3 failed, expected 3'b000 but got %b", y);

    // Test case 4: Fourth bit high
    i = 8'b00001000; // Expected output: 3'b000
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 4 failed, expected 3'b000 but got %b", y);

    // Test case 5: Fifth bit high
    i = 8'b00010000; // Expected output: 3'b001
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 5 failed, expected 3'b001 but got %b", y);

    // Test case 6: Sixth bit high
    i = 8'b00100000; // Expected output: 3'b001
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 6 failed, expected 3'b001 but got %b", y);

    // Test case 7: Seventh bit high
    i = 8'b01000000; // Expected output: 3'b010
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 7 failed, expected 3'b010 but got %b", y);

    // Test case 8: Eighth bit high
    i = 8'b10000000; // Expected output: 3'b010
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 8 failed, expected 3'b010 but got %b", y);

    // Test case 9: Multiple bits high (1, 3, 5, 7)
    i = 8'b10101010; // Expected output: 3'b011
    #10;
    if (y !== 3'b011) $display("FAIL: Test case 9 failed, expected 3'b011 but got %b", y);

    // Test case 10: All bits high
    i = 8'b11111111; // Expected output: 3'b111
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 10 failed, expected 3'b111 but got %b", y);

    $display("PASS");
    $finish;
end

endmodule