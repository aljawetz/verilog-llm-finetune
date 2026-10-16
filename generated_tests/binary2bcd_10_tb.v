`timescale 1ns/1ps

module tb_binary2bcd;

reg [7:0] data;
wire [3:0] bit0, bit1, bit2;
wire [11:0] BCD;

binary2bcd uut (
    .data(data),
    .bit0(bit0),
    .bit1(bit1),
    .bit2(bit2),
    .BCD(BCD)
);

initial begin
    // Test case 1: Convert 0 (00000000)
    data = 8'b00000000; #10;
    if (BCD !== 12'b000000000000) $display("FAIL: Expected BCD for 0 is 000000000000, got %b", BCD);

    // Test case 2: Convert 1 (00000001)
    data = 8'b00000001; #10;
    if (BCD !== 12'b000000000001) $display("FAIL: Expected BCD for 1 is 000000000001, got %b", BCD);

    // Test case 3: Convert 10 (00001010)
    data = 8'b00001010; #10;
    if (BCD !== 12'b000000000010) $display("FAIL: Expected BCD for 10 is 000000000010, got %b", BCD);

    // Test case 4: Convert 99 (01100011)
    data = 8'b01100011; #10;
    if (BCD !== 12'b000000000100) $display("FAIL: Expected BCD for 99 is 000000000100, got %b", BCD);

    // Test case 5: Convert 255 (11111111)
    data = 8'b11111111; #10;
    if (BCD !== 12'b000000001111) $display("FAIL: Expected BCD for 255 is 000000001111, got %b", BCD);

    $display("PASS");
    $finish;
end

endmodule