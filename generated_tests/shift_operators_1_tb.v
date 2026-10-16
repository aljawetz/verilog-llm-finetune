`timescale 1ns/1ps

module tb_shift_operators;

  reg [3:0] in;
  reg [1:0] sel;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  shift_operators uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: Logical left shift
    in = 4'b0001; sel = 2'b00; #10;
    if (out !== 4'b0010) $display("FAIL: Test case 1 failed, expected 4'b0010, got %b", out);

    // Test case 2: Logical right shift
    in = 4'b1000; sel = 2'b01; #10;
    if (out !== 4'b0100) $display("FAIL: Test case 2 failed, expected 4'b0100, got %b", out);

    // Test case 3: Arithmetic left shift
    in = 4'b0010; sel = 2'b10; #10;
    if (out !== 4'b0100) $display("FAIL: Test case 3 failed, expected 4'b0100, got %b", out);

    // Test case 4: Arithmetic right shift
    in = 4'b1000; sel = 2'b11; #10;
    if (out !== 4'b1100) $display("FAIL: Test case 4 failed, expected 4'b1100, got %b", out);

    // Test case 5: Default case
    in = 4'b0000; sel = 2'bxx; #10; // sel is not valid
    if (out !== 4'b0000) $display("FAIL: Test case 5 failed, expected 4'b0000, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule