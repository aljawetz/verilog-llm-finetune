`timescale 1ns/1ps

module tb_encoder_83;

reg [7:0] in;
reg en;
wire [2:0] out;

// Instantiate the module under test (uut)
encoder_83 uut (
    .in(in),
    .out(out),
    .en(en)
);

initial begin
    // Initialize inputs
    in = 8'b00000000;
    en = 0;

    // Test case 1: Enable with one-hot input 00000001
    en = 1;
    in = 8'b00000001; #10;
    if (out !== 3'b000) begin
        $display("FAIL: Expected out=000 for in=00000001 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 2: Enable with one-hot input 00000010
    in = 8'b00000010; #10;
    if (out !== 3'b001) begin
        $display("FAIL: Expected out=001 for in=00000010 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 3: Enable with one-hot input 00000100
    in = 8'b00000100; #10;
    if (out !== 3'b010) begin
        $display("FAIL: Expected out=010 for in=00000100 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 4: Enable with one-hot input 00001000
    in = 8'b00001000; #10;
    if (out !== 3'b011) begin
        $display("FAIL: Expected out=011 for in=00001000 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 5: Enable with one-hot input 00010000
    in = 8'b00010000; #10;
    if (out !== 3'b100) begin
        $display("FAIL: Expected out=100 for in=00010000 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 6: Enable with one-hot input 00100000
    in = 8'b00100000; #10;
    if (out !== 3'b101) begin
        $display("FAIL: Expected out=101 for in=00100000 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 7: Enable with one-hot input 01000000
    in = 8'b01000000; #10;
    if (out !== 3'b110) begin
        $display("FAIL: Expected out=110 for in=01000000 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 8: Enable with one-hot input 10000000
    in = 8'b10000000; #10;
    if (out !== 3'b111) begin
        $display("FAIL: Expected out=111 for in=10000000 with en=1, got out=%b", out);
        $finish;
    end

    // Test case 9: Disable the encoder
    en = 0; in = 8'b00000001; #10;
    if (out !== 3'b000) begin
        $display("FAIL: Expected out=000 for in=00000001 with en=0, got out=%b", out);
        $finish;
    end

    // Test case 10: Invalid input (not one-hot)
    en = 1; in = 8'b00000011; #10;
    if (out !== 3'b000) begin
        $display("FAIL: Expected out=000 for invalid one-hot input with en=1, got out=%b", out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule