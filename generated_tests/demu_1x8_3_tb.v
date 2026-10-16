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
    // Test case 1: Set selector to 0, input a = 1
    s = 3'd0; a = 1'b1; #10;
    if (y !== 8'b00000001) begin
        $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);
        $finish;
    end

    // Test case 2: Set selector to 1, input a = 1
    s = 3'd1; a = 1'b1; #10;
    if (y !== 8'b00000010) begin
        $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);
        $finish;
    end

    // Test case 3: Set selector to 2, input a = 1
    s = 3'd2; a = 1'b1; #10;
    if (y !== 8'b00000100) begin
        $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);
        $finish;
    end

    // Test case 4: Set selector to 3, input a = 1
    s = 3'd3; a = 1'b1; #10;
    if (y !== 8'b00001000) begin
        $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);
        $finish;
    end

    // Test case 5: Set selector to 4, input a = 1
    s = 3'd4; a = 1'b1; #10;
    if (y !== 8'b00010000) begin
        $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);
        $finish;
    end

    // Test case 6: Set selector to 5, input a = 1
    s = 3'd5; a = 1'b1; #10;
    if (y !== 8'b00100000) begin
        $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);
        $finish;
    end

    // Test case 7: Set selector to 6, input a = 1
    s = 3'd6; a = 1'b1; #10;
    if (y !== 8'b01000000) begin
        $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);
        $finish;
    end

    // Test case 8: Set selector to 7, input a = 1
    s = 3'd7; a = 1'b1; #10;
    if (y !== 8'b10000000) begin
        $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);
        $finish;
    end

    // Test case 9: Set all outputs to 0 when a = 0
    s = 3'd0; a = 1'b0; #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule