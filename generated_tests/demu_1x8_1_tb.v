`timescale 1ns/1ps

module tb_demu_1x8;

reg [2:0] s;
reg a;
wire [7:0] y;

demu_1x8 uut (
    .y(y),
    .s(s),
    .a(a)
);

initial begin
    // Test case 1: Select 0, input 1
    s = 3'd0; a = 1'b1; #10;
    if (y !== 8'b00000001) $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);

    // Test case 2: Select 1, input 1
    s = 3'd1; a = 1'b1; #10;
    if (y !== 8'b00000010) $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);

    // Test case 3: Select 2, input 1
    s = 3'd2; a = 1'b1; #10;
    if (y !== 8'b00000100) $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);

    // Test case 4: Select 3, input 1
    s = 3'd3; a = 1'b1; #10;
    if (y !== 8'b00001000) $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);

    // Test case 5: Select 4, input 1
    s = 3'd4; a = 1'b1; #10;
    if (y !== 8'b00010000) $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);

    // Test case 6: Select 5, input 1
    s = 3'd5; a = 1'b1; #10;
    if (y !== 8'b00100000) $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);

    // Test case 7: Select 6, input 1
    s = 3'd6; a = 1'b1; #10;
    if (y !== 8'b01000000) $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);

    // Test case 8: Select 7, input 1
    s = 3'd7; a = 1'b1; #10;
    if (y !== 8'b10000000) $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);

    // Test case 9: Select 0, input 0
    s = 3'd0; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);

    // Test case 10: Select 1, input 0
    s = 3'd1; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 10 failed, expected 00000000, got %b", y);

    // Test case 11: Select 2, input 0
    s = 3'd2; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 11 failed, expected 00000000, got %b", y);

    // Test case 12: Select 3, input 0
    s = 3'd3; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 12 failed, expected 00000000, got %b", y);

    // Test case 13: Select 4, input 0
    s = 3'd4; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 13 failed, expected 00000000, got %b", y);

    // Test case 14: Select 5, input 0
    s = 3'd5; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 14 failed, expected 00000000, got %b", y);

    // Test case 15: Select 6, input 0
    s = 3'd6; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 15 failed, expected 00000000, got %b", y);

    // Test case 16: Select 7, input 0
    s = 3'd7; a = 1'b0; #10;
    if (y !== 8'b00000000) $display("FAIL: Test case 16 failed, expected 00000000, got %b", y);

    $display("PASS");
    $finish;
end

endmodule