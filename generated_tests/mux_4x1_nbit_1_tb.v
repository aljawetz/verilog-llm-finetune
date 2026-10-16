`timescale 1ns/1ps

module tb_mux_4x1_nbit;

  // Parameters
  parameter n = 3;

  // Inputs
  reg [n-1:0] x0;
  reg [n-1:0] x1;
  reg [n-1:0] x2;
  reg [n-1:0] x3;
  reg [1:0] s;

  // Output
  wire [n-1:0] y;

  // Instantiate the Unit Under Test (UUT)
  mux_4x1_nbit #(n) uut (
    .x0(x0),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .s(s),
    .y(y)
  );

  initial begin
    // Initialize inputs
    x0 = 3'b000; x1 = 3'b001; x2 = 3'b010; x3 = 3'b011;
    s = 2'b00;

    // Test cases
    #10;
    if (y !== x0) $display("FAIL: Expected y = %b, got y = %b for s = %b", x0, y, s);

    s = 2'b01; #10;
    if (y !== x1) $display("FAIL: Expected y = %b, got y = %b for s = %b", x1, y, s);

    s = 2'b10; #10;
    if (y !== x2) $display("FAIL: Expected y = %b, got y = %b for s = %b", x2, y, s);

    s = 2'b11; #10;
    if (y !== x3) $display("FAIL: Expected y = %b, got y = %b for s = %b", x3, y, s);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule