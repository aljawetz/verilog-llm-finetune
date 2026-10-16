`timescale 1ns/1ps

module tb_encoder8;

reg en;
reg [7:0] din;
wire [2:0] dout;

// Instantiate the encoder8 module
encoder8 uut (
    .en(en),
    .din(din),
    .dout(dout)
);

initial begin
    // Test case 1: Enable is low, one-hot input at position 0
    en = 0; din = 8'b00000001; #10;
    if (dout !== 3'b000) $display("FAIL: Expected dout = 000, got %b", dout);

    // Test case 2: Enable is low, one-hot input at position 1
    en = 0; din = 8'b00000010; #10;
    if (dout !== 3'b001) $display("FAIL: Expected dout = 001, got %b", dout);

    // Test case 3: Enable is low, one-hot input at position 2
    en = 0; din = 8'b00000100; #10;
    if (dout !== 3'b010) $display("FAIL: Expected dout = 010, got %b", dout);

    // Test case 4: Enable is low, one-hot input at position 3
    en = 0; din = 8'b00001000; #10;
    if (dout !== 3'b011) $display("FAIL: Expected dout = 011, got %b", dout);

    // Test case 5: Enable is low, one-hot input at position 4
    en = 0; din = 8'b00010000; #10;
    if (dout !== 3'b100) $display("FAIL: Expected dout = 100, got %b", dout);

    // Test case 6: Enable is low, one-hot input at position 5
    en = 0; din = 8'b00100000; #10;
    if (dout !== 3'b101) $display("FAIL: Expected dout = 101, got %b", dout);

    // Test case 7: Enable is low, one-hot input at position 6
    en = 0; din = 8'b01000000; #10;
    if (dout !== 3'b110) $display("FAIL: Expected dout = 110, got %b", dout);

    // Test case 8: Enable is low, one-hot input at position 7
    en = 0; din = 8'b10000000; #10;
    if (dout !== 3'b111) $display("FAIL: Expected dout = 111, got %b", dout);

    // Test case 9: Enable is high, should output high impedance
    en = 1; din = 8'b00000001; #10;
    if (dout !== 3'bzzz) $display("FAIL: Expected dout = ZZZ, got %b", dout);

    // Test case 10: Enable is high, should output high impedance with different input
    en = 1; din = 8'b00000100; #10;
    if (dout !== 3'bzzz) $display("FAIL: Expected dout = ZZZ, got %b", dout);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule