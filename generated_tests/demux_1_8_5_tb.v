`timescale 1ns/1ps

module tb_demux_1_8;

  reg din;
  reg [2:0] sel;
  wire [7:0] y;

  // Instantiate the demux_1_8 module
  demux_1_8 uut (
    .din(din),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Initialize inputs
    din = 0;
    sel = 3'b000;

    // Test all selections with din = 1
    din = 1;

    // Test case for sel = 000
    sel = 3'b000; #10;
    if (y !== 8'b00000001) $display("FAIL: sel=000, expected 00000001, got %b", y);

    // Test case for sel = 001
    sel = 3'b001; #10;
    if (y !== 8'b00000010) $display("FAIL: sel=001, expected 00000010, got %b", y);

    // Test case for sel = 010
    sel = 3'b010; #10;
    if (y !== 8'b00000100) $display("FAIL: sel=010, expected 00000100, got %b", y);

    // Test case for sel = 011
    sel = 3'b011; #10;
    if (y !== 8'b00001000) $display("FAIL: sel=011, expected 00001000, got %b", y);

    // Test case for sel = 100
    sel = 3'b100; #10;
    if (y !== 8'b00010000) $display("FAIL: sel=100, expected 00010000, got %b", y);

    // Test case for sel = 101
    sel = 3'b101; #10;
    if (y !== 8'b00100000) $display("FAIL: sel=101, expected 00100000, got %b", y);

    // Test case for sel = 110
    sel = 3'b110; #10;
    if (y !== 8'b01000000) $display("FAIL: sel=110, expected 01000000, got %b", y);

    // Test case for sel = 111
    sel = 3'b111; #10;
    if (y !== 8'b10000000) $display("FAIL: sel=111, expected 10000000, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule