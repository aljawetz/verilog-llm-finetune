`timescale 1ns/1ps

module tb_binary2bcd;

  reg [7:0] binary;
  wire [11:0] bcd;

  // Instantiate the module under test (uut)
  binary2bcd uut (
    .binary(binary),
    .bcd(bcd)
  );

  initial begin
    // Test case 1: binary = 0
    binary = 8'd0;
    #10;
    if (bcd !== 12'd0) $display("FAIL: Test case 1 failed, expected BCD 0, got %d", bcd);

    // Test case 2: binary = 1
    binary = 8'd1;
    #10;
    if (bcd !== 12'd1) $display("FAIL: Test case 2 failed, expected BCD 1, got %d", bcd);

    // Test case 3: binary = 10
    binary = 8'd10;
    #10;
    if (bcd !== 12'd10) $display("FAIL: Test case 3 failed, expected BCD 10, got %d", bcd);

    // Test case 4: binary = 99
    binary = 8'd99;
    #10;
    if (bcd !== 12'd99) $display("FAIL: Test case 4 failed, expected BCD 99, got %d", bcd);

    // Test case 5: binary = 100
    binary = 8'd100;
    #10;
    if (bcd !== 12'd100) $display("FAIL: Test case 5 failed, expected BCD 100, got %d", bcd);

    // Test case 6: binary = 255
    binary = 8'd255;
    #10;
    if (bcd !== 12'd255) $display("FAIL: Test case 6 failed, expected BCD 255, got %d", bcd);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule