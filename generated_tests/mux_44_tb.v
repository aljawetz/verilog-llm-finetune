`timescale 1ns/1ps

module tb_mux_one;

  parameter WIDTH = 4;
  parameter WIDTH_SZ = $clog2(WIDTH);
  
  reg [WIDTH-1:0] in;
  reg [WIDTH_SZ-1:0] sel;
  wire out;

  // Instantiate the module under test
  mux_one #(
    .WIDTH(WIDTH)
  ) uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: Select first bit
    in = 4'b1010; sel = 2'b00; #10;
    if (out !== 1'b1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

    // Test case 2: Select second bit
    in = 4'b1010; sel = 2'b01; #10;
    if (out !== 1'b0) $display("FAIL: Test case 2 failed, expected out = 0, got out = %b", out);

    // Test case 3: Select third bit
    in = 4'b1010; sel = 2'b10; #10;
    if (out !== 1'b1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

    // Test case 4: Select fourth bit
    in = 4'b1010; sel = 2'b11; #10;
    if (out !== 1'b0) $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule