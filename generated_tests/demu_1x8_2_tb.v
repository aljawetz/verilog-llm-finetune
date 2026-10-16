`timescale 1ns/1ps

module tb_demu_1x8;

reg [2:0] s;
reg a;
wire [7:0] y;

// Instantiate the module under test
demu_1x8 uut (
    .y(y),
    .s(s),
    .a(a)
);

initial begin
    // Test case 1: Check output when s = 0 and a = 1
    s = 3'd0; a = 1'b1; #10;
    if (y !== 8'b00000001) begin
        $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);
        $finish;
    end

    // Test case 2: Check output when s = 1 and a = 1
    s = 3'd1; a = 1'b1; #10;
    if (y !== 8'b00000010) begin
        $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);
        $finish;
    end

    // Test case 3: Check output when s = 2 and a = 1
    s = 3'd2; a = 1'b1; #10;
    if (y !== 8'b00000100) begin
        $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);
        $finish;
    end

    // Test case 4: Check output when s = 3 and a = 1
    s = 3'd3; a = 1'b1; #10;
    if (y !== 8'b00001000) begin
        $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);
        $finish;
    end

    // Test case 5: Check output when s = 4 and a = 1
    s = 3'd4; a = 1'b1; #10;
    if (y !== 8'b00010000) begin
        $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);
        $finish;
    end

    // Test case 6: Check output when s = 5 and a = 1
    s = 3'd5; a = 1'b1; #10;
    if (y !== 8'b00100000) begin
        $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);
        $finish;
    end

    // Test case 7: Check output when s = 6 and a = 1
    s = 3'd6; a = 1'b1; #10;
    if (y !== 8'b01000000) begin
        $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);
        $finish;
    end

    // Test case 8: Check output when s = 7 and a = 1
    s = 3'd7; a = 1'b1; #10;
    if (y !== 8'b10000000) begin
        $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);
        $finish;
    end

    // Test case 9: Check output when s = 0 and a = 0
    s = 3'd0; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);
        $finish;
    end

    // Test case 10: Check output when s = 1 and a = 0
    s = 3'd1; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 10 failed, expected 00000000, got %b", y);
        $finish;
    end

    // Test case 11: Check output when s = 2 and a = 0
    s = 3'd2; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 11 failed, expected 00000000, got %b", y);
        $finish;
    end

    // Test case 12: Check output when s = 3 and a = 0
    s = 3'd3; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 12 failed, expected 00000000, got %b", y);
        $finish;
    end

    // Test case 13: Check output when s = 4 and a = 0
    s = 3'd4; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 13 failed, expected 00000000, got %b", y);
        $finish;
    end

    // Test case 14: Check output when s = 5 and a = 0
    s = 3'd5; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 14 failed, expected 00000000, got %b", y);
        $finish;
    end

    // Test case 15: Check output when s = 6 and a = 0
    s = 3'd6; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 15 failed, expected 00000000, got %b", y);
        $finish;
    end

    // Test case 16: Check output when s = 7 and a = 0
    s = 3'd7; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 16 failed, expected 00000000, got %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule