`timescale 1ns/1ps

module tb_encoder8to3S;

reg [7:0] i;
wire [2:0] y;

// Instantiate the module under test
encoder8to3S uut (
    .i(i),
    .y(y)
);

initial begin
    // Test case 1: Input = 8'b00000001 (y should be 3'b000)
    i = 8'b00000001;
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

    // Test case 2: Input = 8'b00000010 (y should be 3'b000)
    i = 8'b00000010;
    #10;
    if (y !== 3'b000) $display("FAIL: Test case 2 failed, expected 000, got %b", y);

    // Test case 3: Input = 8'b00000100 (y should be 3'b001)
    i = 8'b00000100;
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 3 failed, expected 001, got %b", y);

    // Test case 4: Input = 8'b00001000 (y should be 3'b010)
    i = 8'b00001000;
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 4 failed, expected 010, got %b", y);

    // Test case 5: Input = 8'b00010000 (y should be 3'b010)
    i = 8'b00010000;
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 5 failed, expected 010, got %b", y);

    // Test case 6: Input = 8'b00100000 (y should be 3'b011)
    i = 8'b00100000;
    #10;
    if (y !== 3'b011) $display("FAIL: Test case 6 failed, expected 011, got %b", y);

    // Test case 7: Input = 8'b01000000 (y should be 3'b011)
    i = 8'b01000000;
    #10;
    if (y !== 3'b011) $display("FAIL: Test case 7 failed, expected 011, got %b", y);

    // Test case 8: Input = 8'b10000000 (y should be 3'b011)
    i = 8'b10000000;
    #10;
    if (y !== 3'b011) $display("FAIL: Test case 8 failed, expected 011, got %b", y);

    // Test case 9: Input = 8'b11111111 (y should be 3'b111)
    i = 8'b11111111;
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 9 failed, expected 111, got %b", y);

    // Test case 10: Input = 8'b10101010 (y should be 3'b111)
    i = 8'b10101010;
    #10;
    if (y !== 3'b111) $display("FAIL: Test case 10 failed, expected 111, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule