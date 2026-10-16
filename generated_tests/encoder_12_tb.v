`timescale 1ns/1ps

module tb_encoder;

reg [7:0] din;
reg en;
wire [2:0] y;

// Instantiate the encoder module
encoder uut (
    .din(din),
    .y(y),
    .en(en)
);

initial begin
    // Initialize inputs
    din = 8'b00000000;
    en = 0;

    // Test case 1: Check output when disabled
    #10;
    if (y !== 3'bzzz) begin
        $display("FAIL: Expected high-impedance when disabled, got %b", y);
        $finish;
    end

    // Enable the encoder
    en = 1;

    // Test case 2: Check each input one-hot encoding
    din = 8'b00000001; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected output 000 for input %b, got %b", din, y);
        $finish;
    end

    din = 8'b00000010; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected output 001 for input %b, got %b", din, y);
        $finish;
    end

    din = 8'b00000100; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Expected output 010 for input %b, got %b", din, y);
        $finish;
    end

    din = 8'b00001000; #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected output 011 for input %b, got %b", din, y);
        $finish;
    end

    din = 8'b00010000; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Expected output 100 for input %b, got %b", din, y);
        $finish;
    end

    din = 8'b00100000; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected output 101 for input %b, got %b", din, y);
        $finish;
    end

    din = 8'b01000000; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected output 110 for input %b, got %b", din, y);
        $finish;
    end

    din = 8'b10000000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected output 111 for input %b, got %b", din, y);
        $finish;
    end

    // Test case 3: Check output when disabled again
    en = 0; #10;
    if (y !== 3'bzzz) begin
        $display("FAIL: Expected high-impedance when disabled, got %b", y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule