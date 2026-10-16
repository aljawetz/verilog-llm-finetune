`timescale 1ns/1ps

module tb_encoder_dectoBCD;

reg [9:0] i;
wire [3:0] y;

// Instantiate the module under test (uut)
encoder_dectoBCD uut (
    .i(i),
    .y(y)
);

initial begin
    // Test case 1: Input = 0000000000 (0 in BCD)
    i = 10'b0000000000;
    #10;
    if (y !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", y);

    // Test case 2: Input = 0000000001 (1 in BCD)
    i = 10'b0000000001;
    #10;
    if (y !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", y);

    // Test case 3: Input = 0000000010 (2 in BCD)
    i = 10'b0000000010;
    #10;
    if (y !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", y);

    // Test case 4: Input = 0000000110 (3 in BCD)
    i = 10'b0000000110;
    #10;
    if (y !== 4'b0011) $display("FAIL: Test case 4 failed, expected 0011, got %b", y);

    // Test case 5: Input = 0000001110 (4 in BCD)
    i = 10'b0000001110;
    #10;
    if (y !== 4'b0100) $display("FAIL: Test case 5 failed, expected 0100, got %b", y);

    // Test case 6: Input = 0000111110 (5 in BCD)
    i = 10'b0000111110;
    #10;
    if (y !== 4'b0101) $display("FAIL: Test case 6 failed, expected 0101, got %b", y);

    // Test case 7: Input = 0011111110 (6 in BCD)
    i = 10'b0011111110;
    #10;
    if (y !== 4'b0110) $display("FAIL: Test case 7 failed, expected 0110, got %b", y);

    // Test case 8: Input = 0111111110 (7 in BCD)
    i = 10'b0111111110;
    #10;
    if (y !== 4'b0111) $display("FAIL: Test case 8 failed, expected 0111, got %b", y);

    // Test case 9: Input = 1111111110 (8 in BCD)
    i = 10'b1111111110;
    #10;
    if (y !== 4'b1000) $display("FAIL: Test case 9 failed, expected 1000, got %b", y);

    // Test case 10: Input = 1111111111 (9 in BCD)
    i = 10'b1111111111;
    #10;
    if (y !== 4'b1001) $display("FAIL: Test case 10 failed, expected 1001, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule