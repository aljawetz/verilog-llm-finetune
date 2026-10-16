`timescale 1ns/1ps

module tb_adder;

  reg [7:0] In;
  wire [7:0] Out;

  // Instantiate the module under test (uut)
  adder uut (
    .In(In),
    .Out(Out)
  );

  initial begin
    // Test sequence
    In = 8'b00000000; // Test with 0
    #10;
    if (Out !== 8'b00000001) $display("FAIL: Expected 1 for input 0, got %b", Out);

    In = 8'b00000001; // Test with 1
    #10;
    if (Out !== 8'b00000010) $display("FAIL: Expected 2 for input 1, got %b", Out);

    In = 8'b00001111; // Test with 15
    #10;
    if (Out !== 8'b00010000) $display("FAIL: Expected 16 for input 15, got %b", Out);

    In = 8'b11111111; // Test with 255 (max value)
    #10;
    if (Out !== 8'b00000000) $display("FAIL: Expected 0 for input 255, got %b", Out);

    In = 8'b10101010; // Test with 170
    #10;
    if (Out !== 8'b10101011) $display("FAIL: Expected 171 for input 170, got %b", Out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule