`timescale 1ns/1ps

module tb_ADD;

  reg [15:0] in1;
  reg [15:0] in2;
  wire [15:0] out;

  // Instantiate the module under test (uut)
  ADD uut (
    .in1(in1),
    .in2(in2),
    .out(out)
  );

  initial begin
    // Test case 1: Simple addition
    in1 = 16'h0001; // 1
    in2 = 16'h0001; // 1
    #10;
    if (out !== 16'h0002) $display("FAIL: Test case 1 failed, expected 2 but got %h", out);

    // Test case 2: Addition with zero
    in1 = 16'h0000; // 0
    in2 = 16'h0001; // 1
    #10;
    if (out !== 16'h0001) $display("FAIL: Test case 2 failed, expected 1 but got %h", out);

    // Test case 3: Maximum values
    in1 = 16'hFFFF; // 65535
    in2 = 16'h0001; // 1
    #10;
    if (out !== 16'h0000) $display("FAIL: Test case 3 failed, expected 0 but got %h", out); // Overflow case

    // Test case 4: Random values
    in1 = 16'h1234; // 4660
    in2 = 16'h5678; // 22136
    #10;
    if (out !== 16'h68AC) $display("FAIL: Test case 4 failed, expected 68AC but got %h", out);

    // Test case 5: Another random addition
    in1 = 16'hABCD; // 43981
    in2 = 16'h1234; // 4660
    #10;
    if (out !== 16'hC001) $display("FAIL: Test case 5 failed, expected C001 but got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule