`timescale 1ns/1ps

module tb_encoder4_2;

  reg [3:0] d;
  wire a, b;

  // Instantiate the encoder4_2 module
  encoder4_2 uut (
    .d(d),
    .a(a),
    .b(b)
  );

  initial begin
    // Test case 1: Input = 0001 (d[0] = 1)
    d = 4'b0001; #10;
    if (a !== 0 || b !== 0) $display("FAIL: Test case 1 failed, expected a=0, b=0");

    // Test case 2: Input = 0010 (d[1] = 1)
    d = 4'b0010; #10;
    if (a !== 0 || b !== 1) $display("FAIL: Test case 2 failed, expected a=0, b=1");

    // Test case 3: Input = 0100 (d[2] = 1)
    d = 4'b0100; #10;
    if (a !== 1 || b !== 0) $display("FAIL: Test case 3 failed, expected a=1, b=0");

    // Test case 4: Input = 1000 (d[3] = 1)
    d = 4'b1000; #10;
    if (a !== 1 || b !== 1) $display("FAIL: Test case 4 failed, expected a=1, b=1");

    // Test case 5: Input = 0000 (no input)
    d = 4'b0000; #10;
    if (a !== 0 || b !== 0) $display("FAIL: Test case 5 failed, expected a=0, b=0");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule