`timescale 1ns/1ps

module tb_add_1;

  reg [15:0] in;
  wire [15:0] out;

  // Instantiate the module under test (uut)
  add_1 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Increment 0
    in = 16'h0000; #10;
    if (out !== 16'h0001) $display("FAIL: Test case 1 failed, expected 0x0001, got %h", out);

    // Test case 2: Increment 1
    in = 16'h0001; #10;
    if (out !== 16'h0002) $display("FAIL: Test case 2 failed, expected 0x0002, got %h", out);

    // Test case 3: Increment 255
    in = 16'h00FF; #10;
    if (out !== 16'h0100) $display("FAIL: Test case 3 failed, expected 0x0100, got %h", out);

    // Test case 4: Increment 65535 (max value)
    in = 16'hFFFF; #10;
    if (out !== 16'h0000) $display("FAIL: Test case 4 failed, expected 0x0000, got %h", out);

    // Test case 5: Increment 32768
    in = 16'h8000; #10;
    if (out !== 16'h8001) $display("FAIL: Test case 5 failed, expected 0x8001, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule