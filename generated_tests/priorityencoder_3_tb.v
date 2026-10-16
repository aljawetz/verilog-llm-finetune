`timescale 1ns/1ps

module tb_priorityencoder;
  reg en;
  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  priorityencoder uut (
    .en(en),
    .i(i),
    .y(y)
  );

  initial begin
    // Test case 1: Enable with highest bit set
    en = 1;
    i = 8'b00000001; // Expect output 000
    #10;
    if (y !== 3'b000) $display("FAIL: Expected 000, got %b", y);

    // Test case 2: Enable with second highest bit set
    i = 8'b00000010; // Expect output 001
    #10;
    if (y !== 3'b001) $display("FAIL: Expected 001, got %b", y);

    // Test case 3: Enable with middle bit set
    i = 8'b00001100; // Expect output 011
    #10;
    if (y !== 3'b011) $display("FAIL: Expected 011, got %b", y);

    // Test case 4: Enable with highest bit set
    i = 8'b10000000; // Expect output 111
    #10;
    if (y !== 3'b111) $display("FAIL: Expected 111, got %b", y);

    // Test case 5: Enable with no bits set
    i = 8'b00000000; // Expect output 000
    #10;
    if (y !== 3'b000) $display("FAIL: Expected 000, got %b", y);

    // Test case 6: Disable the encoder
    en = 0;
    i = 8'b11111111; // Expect output high impedance
    #10;
    if (y !== 3'bzzz) $display("FAIL: Expected high impedance, got %b", y);

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule